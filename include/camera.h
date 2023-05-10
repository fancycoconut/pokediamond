#ifndef POKEDIAMOND_CAMERA_H
#define POKEDIAMOND_CAMERA_H

#include "fx.h"
#include "global.h"

struct CameraHistory
{
    s32 count;
    s32 readIdx;
    s32 writeIdx;
    s32 writeIdxInit;
    BOOL overrideEnabled;
    BOOL enableUpdateX;
    BOOL enableUpdateY;
    BOOL enableUpdateZ;
    VecFx32 * vecs;
};

struct CameraAngle
{
    u16 x;
    u16 y;
    u16 z;
    u16 unused;
};

struct CameraPerspective
{
    fx32 fovySin;
    fx32 fovyCos;
    fx32 aspect;
    fx32 near;
    fx32 far;
};

struct CameraLookAt
{
    VecFx32 camPos;
    VecFx32 camTarget;
    VecFx32 camUp;
};

struct CameraWork
{
    struct CameraPerspective perspective;
    struct CameraLookAt lookAt;
    fx32 distance;
    struct CameraAngle angle;
    u8 perspectiveType;
    u16 perspectiveAngle;
    VecFx32 lastTarget;
    const VecFx32 * currTarget_p;
    BOOL enableOffsetX;
    BOOL enableOffsetY;
    BOOL enableOffsetZ;
    struct CameraHistory * history;
};

void Camera_CalcLookAtPosFromTargetAndAngle(struct CameraWork * camera);
void Camera_CalcLookAtTargetFromPosAndAngle(struct CameraWork * camera);
void Camera_InitInternal(u16 perspectiveAngle, struct CameraWork * camera);
void Camera_VecResetCoordsIfOffsetComponentNotEnabled(struct CameraWork * camera, VecFx32 * vec);
void Camera_GetVecFromSomeRingBufferMaybe(struct CameraWork * camera, const VecFx32 * vecDefault, VecFx32 * vecDst);
void Camera_AllocHistory(s32 count, s32 initialWriteIdx, s32 updateEnableFlags, s32 heap_id, struct CameraWork * camera);
void Camera_FreeHistory(struct CameraWork * camera);
struct CameraWork * Camera_Alloc(u32 heap_id);
void Camera_Free(struct CameraWork * camera);
void Camera_Copy(struct CameraWork * src, struct CameraWork * dest);
void Camera_SetWorkPtr(struct CameraWork * camera);
void Camera_UnsetWorkPtr(void);
void Camera_PushLookAtToNNSGlb(void);
void Camera_SetLookAtCamUp(VecFx32 * camUp, struct CameraWork * camera);
void Camera_SetFixedTarget(VecFx32 * target, struct CameraWork * camera);
void Camera_ClearFixedTarget(struct CameraWork * camera);
void Camera_SetPerspectiveClippingPlane(s32 n, s32 f, struct CameraWork * camera);
void Camera_InitWithTargetAndAngle(VecFx32 * target, fx32 distance, struct CameraAngle * angle, u16 perspectiveAngle, u8 perspectiveType, BOOL fixReference, struct CameraWork * camera);
void Camera_InitWithPosAndAngle(VecFx32 * pos, fx32 distance, struct CameraAngle * angle, u16 perspectiveAngle, u8 sp18, struct CameraWork * camera);
void Camera_InitWithPosAndTarget(const VecFx32 *target, const VecFx32 *pos, u16 perspectiveAngle, u8 perspectiveType, BOOL setReference, struct CameraWork * camera);
void Camera_ApplyPerspectiveType(u8 perspectiveType, struct CameraWork * camera);
void Camera_SetPerspectiveAngle(u16 perspectiveAngle, struct CameraWork * camera);
void Camera_AdjustPerspectiveAngle(u16 rotation, struct CameraWork * camera);
void Camera_OffsetLookAtPosAndTarget(const VecFx32 *delta, struct CameraWork * camera);
void Camera_SetAngle(const struct CameraAngle * angle, struct CameraWork * camera);
void Camera_AdjustAngle(const struct CameraAngle * delta, struct CameraWork * camera);
void Camera_SetDistance(fx32 distance, struct CameraWork * camera);
void Camera_SetLookAtTargetAndRecalcPos(const VecFx32 * target, struct CameraWork * camera);
u16 Camera_GetPerspectiveAngle(struct CameraWork * camera);
fx32 Camera_GetDistance(struct CameraWork * camera);
void Camera_GetAngle(struct CameraAngle * dest, struct CameraWork * camera);
void Camera_GetLookAtCamTarget(VecFx32 * dest, const struct CameraWork * camera);
void Camera_GetLookAtCamPos(VecFx32 * dest, const struct CameraWork * camera);
void Camera_SetLookAtCamTarget(const VecFx32 * target, struct CameraWork * camera);
void Camera_SetLookAtCamPos(const VecFx32 * pos, struct CameraWork * camera);

#endif // POKEDIAMOND_CAMERA_H