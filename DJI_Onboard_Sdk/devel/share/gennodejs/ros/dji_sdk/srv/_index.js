
"use strict";

let MFIOConfig = require('./MFIOConfig.js')
let MissionWpAction = require('./MissionWpAction.js')
let SendMobileData = require('./SendMobileData.js')
let QueryDroneVersion = require('./QueryDroneVersion.js')
let SetHardSync = require('./SetHardSync.js')
let SetupCameraStream = require('./SetupCameraStream.js')
let MissionHpUpload = require('./MissionHpUpload.js')
let StereoVGASubscription = require('./StereoVGASubscription.js')
let MissionHpUpdateYawRate = require('./MissionHpUpdateYawRate.js')
let MissionHpUpdateRadius = require('./MissionHpUpdateRadius.js')
let MFIOSetValue = require('./MFIOSetValue.js')
let MissionWpSetSpeed = require('./MissionWpSetSpeed.js')
let MissionHpAction = require('./MissionHpAction.js')
let MissionStatus = require('./MissionStatus.js')
let Stereo240pSubscription = require('./Stereo240pSubscription.js')
let StereoDepthSubscription = require('./StereoDepthSubscription.js')
let MissionHpResetYaw = require('./MissionHpResetYaw.js')
let SDKControlAuthority = require('./SDKControlAuthority.js')
let CameraAction = require('./CameraAction.js')
let SendPayloadData = require('./SendPayloadData.js')
let MissionHpGetInfo = require('./MissionHpGetInfo.js')
let DroneTaskControl = require('./DroneTaskControl.js')
let DroneArmControl = require('./DroneArmControl.js')
let Activation = require('./Activation.js')
let MissionWpUpload = require('./MissionWpUpload.js')
let MissionWpGetInfo = require('./MissionWpGetInfo.js')
let SetLocalPosRef = require('./SetLocalPosRef.js')
let MissionWpGetSpeed = require('./MissionWpGetSpeed.js')

module.exports = {
  MFIOConfig: MFIOConfig,
  MissionWpAction: MissionWpAction,
  SendMobileData: SendMobileData,
  QueryDroneVersion: QueryDroneVersion,
  SetHardSync: SetHardSync,
  SetupCameraStream: SetupCameraStream,
  MissionHpUpload: MissionHpUpload,
  StereoVGASubscription: StereoVGASubscription,
  MissionHpUpdateYawRate: MissionHpUpdateYawRate,
  MissionHpUpdateRadius: MissionHpUpdateRadius,
  MFIOSetValue: MFIOSetValue,
  MissionWpSetSpeed: MissionWpSetSpeed,
  MissionHpAction: MissionHpAction,
  MissionStatus: MissionStatus,
  Stereo240pSubscription: Stereo240pSubscription,
  StereoDepthSubscription: StereoDepthSubscription,
  MissionHpResetYaw: MissionHpResetYaw,
  SDKControlAuthority: SDKControlAuthority,
  CameraAction: CameraAction,
  SendPayloadData: SendPayloadData,
  MissionHpGetInfo: MissionHpGetInfo,
  DroneTaskControl: DroneTaskControl,
  DroneArmControl: DroneArmControl,
  Activation: Activation,
  MissionWpUpload: MissionWpUpload,
  MissionWpGetInfo: MissionWpGetInfo,
  SetLocalPosRef: SetLocalPosRef,
  MissionWpGetSpeed: MissionWpGetSpeed,
};
