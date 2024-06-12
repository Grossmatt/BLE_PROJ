// Service UUID
#define SUNLIGHTSERVICE_SERV_UUID 0xBA55

#define SUNLIGHTSERVICE_VAL_UUID  0x2BAD
#define SUNLIGHTSERVICE_SUNLIGHTVALUE_ID   0

#define SUNLIGHTSERVICE_ID_LEN    40

#define SUNLIGHTSERVICE_UPDATEPERIOD_ID   1
#define SUNLIGHTSERVICE_UPDATEPERIOD_UUID 0x2BAE
#define SUNLIGHTSERVICE_UPDATEPERIOD_LEN  2

// Callback when a characteristic value has changed
typedef void (*sunlightServiceChange_t)(uint16_t connHandle, uint16_t svcUuid, uint8_t paramID, uint16_t len, uint8_t *pValue);

typedef struct
{
  sunlightServiceChange_t        pfnChangeCb;  // Called when characteristic value changes
  sunlightServiceChange_t        pfnCfgChangeCb;
} sunlightServiceCBs_t;

extern bStatus_t SunlightService_AddService( uint8_t rspTaskId);

extern bStatus_t SunlightService_RegisterAppCBs( sunlightServiceCBs_t *appCallbacks );

extern bStatus_t SunlightService_SetParameter(uint8_t param, uint16_t len, void *value);

extern bStatus_t SunlightService_GetParameter(uint8_t param, uint16_t *len, void *value);
