/*********************************************************************
 * INCLUDES
 */
#include <string.h>

//#define xdc_runtime_Log_DISABLE_ALL 1  // Add to disable logs from this file
#include <xdc/runtime/Diags.h>
#include <uartlog/UartLog.h>

#include <icall.h>
#include "util.h"
/* This Header file contains all BLE API and icall structure definition */
#include "icall_ble_api.h"

#include "sunlightService.h"



// sunlightService Service UUID
CONST uint8_t sunlightServiceUUID[ATT_BT_UUID_SIZE] =
{
  LO_UINT16(SUNLIGHTSERVICE_SERV_UUID), HI_UINT16(SUNLIGHTSERVICE_SERV_UUID)
};

CONST uint8_t sunlightValUUID[ATT_BT_UUID_SIZE] =
{
  TI_BASE_UUID_128(SUNLIGHTSERVICE_VAL_UUID)
};

CONST uint8_t sunlightService_UpdatePeriodUUID[ATT_UUID_SIZE] =
{
  TI_BASE_UUID_128(SUNLIGHTSERVICE_UPDATEPERIOD_UUID)
};

static sunlightServiceCBs_t *pAppCBs = NULL;

// Service declaration
static CONST gattAttrType_t sunlightServiceDecl = { ATT_BT_UUID_SIZE, sunlightServiceUUID };


static uint8 sunlightValProps = GATT_PROP_READ | GATT_PROP_NOTIFY;

static uint8 sunlightVal[SUNLIGHTSERVICE_ID_LEN] = {0};

// Characteristic "UpdatePeriod" Properties (for declaration)
static uint8_t sunlightService_UpdatePeriodProps = GATT_PROP_READ | GATT_PROP_WRITE;

// Characteristic "UpdatePeriod" Value variable
static uint8_t sunlightService_UpdatePeriodVal[SUNLIGHTSERVICE_UPDATEPERIOD_LEN] = {0};


// Characteristic "Stream" Client Characteristic Configuration Descriptor
static gattCharCfg_t *ss_SUNConfig;



static gattAttribute_t sunlightServiceAttrTbl[] =
{
  // sunlightService Service Declaration
  {
    { ATT_BT_UUID_SIZE, primaryServiceUUID },
    GATT_PERMIT_READ,
    0,
    (uint8_t *)&sunlightServiceDecl
  },

  {
   { ATT_BT_UUID_SIZE, characterUUID },
   GATT_PERMIT_READ,
   0,
   &sunlightValProps
  },

  {
   { ATT_BT_UUID_SIZE, sunlightValUUID },
   GATT_PERMIT_READ,
   0,
   (uint8_t *)sunlightVal
  },

  {
    {ATT_BT_UUID_SIZE, clientCharCfgUUID},
    GATT_PERMIT_READ | GATT_PERMIT_WRITE,
    0,
    (uint8 *)&ss_SUNConfig
  },

  {
    { ATT_BT_UUID_SIZE, characterUUID },
    GATT_PERMIT_READ,
    0,
    &sunlightService_UpdatePeriodProps
  },

  {
   { ATT_UUID_SIZE, sunlightService_UpdatePeriodUUID },
   GATT_PERMIT_READ | GATT_PERMIT_WRITE,
   0,
   sunlightService_UpdatePeriodVal
  },
};

static bStatus_t sunlightService_ReadAttrCB( uint16_t connHandle, gattAttribute_t *pAttr,
                                           uint8_t *pValue, uint16_t *pLen, uint16_t offset,
                                           uint16_t maxLen, uint8_t method );
static bStatus_t sunlightService_WriteAttrCB( uint16_t connHandle, gattAttribute_t *pAttr,
                                            uint8_t *pValue, uint16_t len, uint16_t offset,
                                            uint8_t method );

// Simple Profile Service Callbacks
CONST gattServiceCBs_t sunlightServiceCBs =
{
  sunlightService_ReadAttrCB,  // Read callback function pointer
  sunlightService_WriteAttrCB, // Write callback function pointer
  NULL                       // Authorization callback function pointer
};

extern bStatus_t SunlightService_AddService( uint8_t rspTaskId )
{
  uint8_t status;

  // Allocate Client Characteristic Configuration table
  ss_SUNConfig = (gattCharCfg_t *)ICall_malloc( sizeof(gattCharCfg_t) * linkDBNumConns );
  if ( ss_SUNConfig == NULL )
  {
    return ( bleMemAllocError );
  }

  // Initialize Client Characteristic Configuration attributes
  GATTServApp_InitCharCfg( INVALID_CONNHANDLE, ss_SUNConfig );

  // Register GATT attribute list and CBs with GATT Server App
  status = GATTServApp_RegisterService( sunlightServiceAttrTbl,
                                        GATT_NUM_ATTRS( sunlightServiceAttrTbl ),
                                        GATT_MAX_ENCRYPT_KEY_SIZE,
                                        &sunlightServiceCBs );

  Log_info1("Registered service, %d attributes", (IArg)GATT_NUM_ATTRS( sunlightServiceAttrTbl ));

  return ( status );
}

bStatus_t SunlightService_RegisterAppCBs( sunlightServiceCBs_t *appCallbacks )
{
  if ( appCallbacks )
  {
    pAppCBs = appCallbacks;
    Log_info1("Registered callbacks to application. Struct %p", (IArg)appCallbacks);
    return ( SUCCESS );
  }
  else
  {
    Log_warning0("Null pointer given for app callbacks: Sunlight.");
    return ( FAILURE );
  }
}

bStatus_t SunlightService_SetParameter( uint8_t param, uint16_t len, void *value )
{
  bStatus_t ret = SUCCESS;

  switch ( param )
  {
    case SUNLIGHTSERVICE_SUNLIGHTVALUE_ID:
        if (len == SUNLIGHTSERVICE_ID_LEN)
        {
            memcpy(sunlightVal, value, len);

            GATTServApp_ProcessCharCfg(ss_SUNConfig, (uint8_t *)&sunlightVal, FALSE, sunlightServiceAttrTbl,
                                       GATT_NUM_ATTRS(sunlightServiceAttrTbl), INVALID_TASK_ID, sunlightService_ReadAttrCB);
        }
        else
        {
            Log_info0("I have failed.");
            ret = bleInvalidRange;
        }
        break;
    default:
      Log_info0("I have failed 2.");
      ret = INVALIDPARAMETER;
      break;
  }


  return ret;
}


bStatus_t SunlightService_GetParameter( uint8_t param, uint16_t *len, void *value )
{
  bStatus_t ret = SUCCESS;
  switch ( param )
  {

    case SUNLIGHTSERVICE_UPDATEPERIOD_ID:
      memcpy(value, sunlightService_UpdatePeriodVal, SUNLIGHTSERVICE_UPDATEPERIOD_LEN);
      break;
    default:
      ret = INVALIDPARAMETER;
      break;
  }
  return ret;
}


static bStatus_t sunlightService_ReadAttrCB( uint16_t connHandle, gattAttribute_t *pAttr,
                                       uint8_t *pValue, uint16_t *pLen, uint16_t offset,
                                       uint16_t maxLen, uint8_t method )
{
  bStatus_t status = SUCCESS;


  if (!memcmp(pAttr->type.uuid, sunlightValUUID, pAttr->type.len))
  {
      if (offset > SUNLIGHTSERVICE_ID_LEN)
      {
          status = ATT_ERR_INVALID_OFFSET;
      }
      else
      {
          *pLen = MIN(maxLen, (SUNLIGHTSERVICE_ID_LEN - offset));
          memcpy(pValue, pAttr->pValue + offset, *pLen);
      }
  }
  else if ( ! memcmp(pAttr->type.uuid, sunlightService_UpdatePeriodUUID, pAttr->type.len) )
  {
    if ( offset > SUNLIGHTSERVICE_UPDATEPERIOD_LEN )  // Prevent malicious ATT ReadBlob offsets.
    {
      status = ATT_ERR_INVALID_OFFSET;
    }
    else
    {
      *pLen = MIN(maxLen, SUNLIGHTSERVICE_UPDATEPERIOD_LEN - offset);  // Transmit as much as possible
      memcpy(pValue, pAttr->pValue + offset, *pLen);
    }
  }
  else
  {
      *pLen = 0;
      status = ATT_ERR_ATTR_NOT_FOUND;
  }

  return status;
}


static bStatus_t sunlightService_WriteAttrCB( uint16_t connHandle, gattAttribute_t *pAttr,
                                        uint8_t *pValue, uint16_t len, uint16_t offset,
                                        uint8_t method )
{
  bStatus_t status  = SUCCESS;
  uint8_t   paramID = 0xFF;

  // See if request is regarding a Client Characterisic Configuration
  if ( ! memcmp(pAttr->type.uuid, clientCharCfgUUID, pAttr->type.len) )
  {
    // Allow only notifications.
    status = GATTServApp_ProcessCCCWriteReq( connHandle, pAttr, pValue, len,
                                             offset, GATT_CLIENT_CFG_NOTIFY);
  }
  // See if request is regarding the UpdatePeriod Characteristic Value
  else if ( ! memcmp(pAttr->type.uuid, sunlightService_UpdatePeriodUUID, pAttr->type.len) )
  {
    if ( offset + len > SUNLIGHTSERVICE_UPDATEPERIOD_LEN )
    {
      status = ATT_ERR_INVALID_OFFSET;
    }
    else
    {
      // Copy pValue into the variable we point to from the attribute table.
      memcpy(pAttr->pValue + offset, pValue, len);

      // Only notify application if entire expected value is written
      if ( offset + len == SUNLIGHTSERVICE_UPDATEPERIOD_LEN)
        paramID = SUNLIGHTSERVICE_UPDATEPERIOD_ID;
    }
  }
  else
  {
    // If we get here, that means you've forgotten to add an if clause for a
    // characteristic value attribute in the attribute table that has WRITE permissions.
    status = ATT_ERR_ATTR_NOT_FOUND;
  }

  // Let the application know something changed (if it did) by using the
  // callback it registered earlier (if it did).
  if (paramID != 0xFF)
    if ( pAppCBs && pAppCBs->pfnChangeCb )
    {
      uint16_t svcUuid = SUNLIGHTSERVICE_SERV_UUID;
      pAppCBs->pfnChangeCb(connHandle, svcUuid, paramID, len, pValue); // Call app function from stack task context.
    }
  return status;
}
