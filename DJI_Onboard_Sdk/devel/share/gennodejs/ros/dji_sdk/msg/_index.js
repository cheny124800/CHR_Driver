
"use strict";

let VOPosition = require('./VOPosition.js');
let Emergency = require('./Emergency.js');
let Gimbal = require('./Gimbal.js');
let MobileData = require('./MobileData.js');
let GimCtr = require('./GimCtr.js');
let PayloadData = require('./PayloadData.js');
let GPSUTC = require('./GPSUTC.js');
let WaypointList = require('./WaypointList.js');
let MissionWaypointAction = require('./MissionWaypointAction.js');
let HotpointMission = require('./HotpointMission.js');
let MissionHotpointTask = require('./MissionHotpointTask.js');
let WaypointMission = require('./WaypointMission.js');
let MissionWaypointTask = require('./MissionWaypointTask.js');
let FCTimeInUTC = require('./FCTimeInUTC.js');
let FlightAnomaly = require('./FlightAnomaly.js');
let Waypoint = require('./Waypoint.js');
let MissionWaypoint = require('./MissionWaypoint.js');

module.exports = {
  VOPosition: VOPosition,
  Emergency: Emergency,
  Gimbal: Gimbal,
  MobileData: MobileData,
  GimCtr: GimCtr,
  PayloadData: PayloadData,
  GPSUTC: GPSUTC,
  WaypointList: WaypointList,
  MissionWaypointAction: MissionWaypointAction,
  HotpointMission: HotpointMission,
  MissionHotpointTask: MissionHotpointTask,
  WaypointMission: WaypointMission,
  MissionWaypointTask: MissionWaypointTask,
  FCTimeInUTC: FCTimeInUTC,
  FlightAnomaly: FlightAnomaly,
  Waypoint: Waypoint,
  MissionWaypoint: MissionWaypoint,
};
