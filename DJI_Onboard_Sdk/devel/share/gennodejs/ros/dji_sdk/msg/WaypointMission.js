// Auto-generated. Do not edit!

// (in-package dji_sdk.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class WaypointMission {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.missionIndex = null;
      this.latLntCount = null;
      this.latLntList = null;
      this.actionCount = null;
      this.waypointAction = null;
      this.altitude = null;
      this.velocity = null;
      this.finishAction = null;
      this.headingMode = null;
      this.gimbalAngle = null;
      this.repeatTimes = null;
      this.isUseCam = null;
      this.sor = null;
      this.shootVel = null;
    }
    else {
      if (initObj.hasOwnProperty('missionIndex')) {
        this.missionIndex = initObj.missionIndex
      }
      else {
        this.missionIndex = new std_msgs.msg.UInt8();
      }
      if (initObj.hasOwnProperty('latLntCount')) {
        this.latLntCount = initObj.latLntCount
      }
      else {
        this.latLntCount = new std_msgs.msg.UInt8();
      }
      if (initObj.hasOwnProperty('latLntList')) {
        this.latLntList = initObj.latLntList
      }
      else {
        this.latLntList = [];
      }
      if (initObj.hasOwnProperty('actionCount')) {
        this.actionCount = initObj.actionCount
      }
      else {
        this.actionCount = new std_msgs.msg.UInt8();
      }
      if (initObj.hasOwnProperty('waypointAction')) {
        this.waypointAction = initObj.waypointAction
      }
      else {
        this.waypointAction = [];
      }
      if (initObj.hasOwnProperty('altitude')) {
        this.altitude = initObj.altitude
      }
      else {
        this.altitude = new std_msgs.msg.UInt16();
      }
      if (initObj.hasOwnProperty('velocity')) {
        this.velocity = initObj.velocity
      }
      else {
        this.velocity = new std_msgs.msg.UInt8();
      }
      if (initObj.hasOwnProperty('finishAction')) {
        this.finishAction = initObj.finishAction
      }
      else {
        this.finishAction = new std_msgs.msg.UInt8();
      }
      if (initObj.hasOwnProperty('headingMode')) {
        this.headingMode = initObj.headingMode
      }
      else {
        this.headingMode = new std_msgs.msg.UInt8();
      }
      if (initObj.hasOwnProperty('gimbalAngle')) {
        this.gimbalAngle = initObj.gimbalAngle
      }
      else {
        this.gimbalAngle = new std_msgs.msg.Int16();
      }
      if (initObj.hasOwnProperty('repeatTimes')) {
        this.repeatTimes = initObj.repeatTimes
      }
      else {
        this.repeatTimes = new std_msgs.msg.UInt8();
      }
      if (initObj.hasOwnProperty('isUseCam')) {
        this.isUseCam = initObj.isUseCam
      }
      else {
        this.isUseCam = new std_msgs.msg.UInt8();
      }
      if (initObj.hasOwnProperty('sor')) {
        this.sor = initObj.sor
      }
      else {
        this.sor = new std_msgs.msg.UInt8();
      }
      if (initObj.hasOwnProperty('shootVel')) {
        this.shootVel = initObj.shootVel
      }
      else {
        this.shootVel = new std_msgs.msg.UInt8();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WaypointMission
    // Serialize message field [missionIndex]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.missionIndex, buffer, bufferOffset);
    // Serialize message field [latLntCount]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.latLntCount, buffer, bufferOffset);
    // Serialize message field [latLntList]
    // Serialize the length for message field [latLntList]
    bufferOffset = _serializer.uint32(obj.latLntList.length, buffer, bufferOffset);
    obj.latLntList.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [actionCount]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.actionCount, buffer, bufferOffset);
    // Serialize message field [waypointAction]
    // Serialize the length for message field [waypointAction]
    bufferOffset = _serializer.uint32(obj.waypointAction.length, buffer, bufferOffset);
    obj.waypointAction.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Point.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [altitude]
    bufferOffset = std_msgs.msg.UInt16.serialize(obj.altitude, buffer, bufferOffset);
    // Serialize message field [velocity]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.velocity, buffer, bufferOffset);
    // Serialize message field [finishAction]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.finishAction, buffer, bufferOffset);
    // Serialize message field [headingMode]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.headingMode, buffer, bufferOffset);
    // Serialize message field [gimbalAngle]
    bufferOffset = std_msgs.msg.Int16.serialize(obj.gimbalAngle, buffer, bufferOffset);
    // Serialize message field [repeatTimes]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.repeatTimes, buffer, bufferOffset);
    // Serialize message field [isUseCam]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.isUseCam, buffer, bufferOffset);
    // Serialize message field [sor]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.sor, buffer, bufferOffset);
    // Serialize message field [shootVel]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.shootVel, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WaypointMission
    let len;
    let data = new WaypointMission(null);
    // Deserialize message field [missionIndex]
    data.missionIndex = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [latLntCount]
    data.latLntCount = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [latLntList]
    // Deserialize array length for message field [latLntList]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.latLntList = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.latLntList[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [actionCount]
    data.actionCount = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [waypointAction]
    // Deserialize array length for message field [waypointAction]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.waypointAction = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.waypointAction[i] = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [altitude]
    data.altitude = std_msgs.msg.UInt16.deserialize(buffer, bufferOffset);
    // Deserialize message field [velocity]
    data.velocity = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [finishAction]
    data.finishAction = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [headingMode]
    data.headingMode = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [gimbalAngle]
    data.gimbalAngle = std_msgs.msg.Int16.deserialize(buffer, bufferOffset);
    // Deserialize message field [repeatTimes]
    data.repeatTimes = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [isUseCam]
    data.isUseCam = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [sor]
    data.sor = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [shootVel]
    data.shootVel = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 24 * object.latLntList.length;
    length += 24 * object.waypointAction.length;
    return length + 22;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dji_sdk/WaypointMission';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3cfe4d7c0c45bcdd0d11c1761dfe0b20';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/UInt8 missionIndex
    std_msgs/UInt8 latLntCount
    geometry_msgs/Point[] latLntList
    std_msgs/UInt8 actionCount
    geometry_msgs/Point[] waypointAction
    std_msgs/UInt16 altitude
    std_msgs/UInt8 velocity
    std_msgs/UInt8 finishAction
    std_msgs/UInt8 headingMode
    std_msgs/Int16 gimbalAngle
    std_msgs/UInt8 repeatTimes
    std_msgs/UInt8 isUseCam
    std_msgs/UInt8 sor
    std_msgs/UInt8 shootVel
    
    ================================================================================
    MSG: std_msgs/UInt8
    uint8 data
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: std_msgs/UInt16
    uint16 data
    
    ================================================================================
    MSG: std_msgs/Int16
    int16 data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WaypointMission(null);
    if (msg.missionIndex !== undefined) {
      resolved.missionIndex = std_msgs.msg.UInt8.Resolve(msg.missionIndex)
    }
    else {
      resolved.missionIndex = new std_msgs.msg.UInt8()
    }

    if (msg.latLntCount !== undefined) {
      resolved.latLntCount = std_msgs.msg.UInt8.Resolve(msg.latLntCount)
    }
    else {
      resolved.latLntCount = new std_msgs.msg.UInt8()
    }

    if (msg.latLntList !== undefined) {
      resolved.latLntList = new Array(msg.latLntList.length);
      for (let i = 0; i < resolved.latLntList.length; ++i) {
        resolved.latLntList[i] = geometry_msgs.msg.Point.Resolve(msg.latLntList[i]);
      }
    }
    else {
      resolved.latLntList = []
    }

    if (msg.actionCount !== undefined) {
      resolved.actionCount = std_msgs.msg.UInt8.Resolve(msg.actionCount)
    }
    else {
      resolved.actionCount = new std_msgs.msg.UInt8()
    }

    if (msg.waypointAction !== undefined) {
      resolved.waypointAction = new Array(msg.waypointAction.length);
      for (let i = 0; i < resolved.waypointAction.length; ++i) {
        resolved.waypointAction[i] = geometry_msgs.msg.Point.Resolve(msg.waypointAction[i]);
      }
    }
    else {
      resolved.waypointAction = []
    }

    if (msg.altitude !== undefined) {
      resolved.altitude = std_msgs.msg.UInt16.Resolve(msg.altitude)
    }
    else {
      resolved.altitude = new std_msgs.msg.UInt16()
    }

    if (msg.velocity !== undefined) {
      resolved.velocity = std_msgs.msg.UInt8.Resolve(msg.velocity)
    }
    else {
      resolved.velocity = new std_msgs.msg.UInt8()
    }

    if (msg.finishAction !== undefined) {
      resolved.finishAction = std_msgs.msg.UInt8.Resolve(msg.finishAction)
    }
    else {
      resolved.finishAction = new std_msgs.msg.UInt8()
    }

    if (msg.headingMode !== undefined) {
      resolved.headingMode = std_msgs.msg.UInt8.Resolve(msg.headingMode)
    }
    else {
      resolved.headingMode = new std_msgs.msg.UInt8()
    }

    if (msg.gimbalAngle !== undefined) {
      resolved.gimbalAngle = std_msgs.msg.Int16.Resolve(msg.gimbalAngle)
    }
    else {
      resolved.gimbalAngle = new std_msgs.msg.Int16()
    }

    if (msg.repeatTimes !== undefined) {
      resolved.repeatTimes = std_msgs.msg.UInt8.Resolve(msg.repeatTimes)
    }
    else {
      resolved.repeatTimes = new std_msgs.msg.UInt8()
    }

    if (msg.isUseCam !== undefined) {
      resolved.isUseCam = std_msgs.msg.UInt8.Resolve(msg.isUseCam)
    }
    else {
      resolved.isUseCam = new std_msgs.msg.UInt8()
    }

    if (msg.sor !== undefined) {
      resolved.sor = std_msgs.msg.UInt8.Resolve(msg.sor)
    }
    else {
      resolved.sor = new std_msgs.msg.UInt8()
    }

    if (msg.shootVel !== undefined) {
      resolved.shootVel = std_msgs.msg.UInt8.Resolve(msg.shootVel)
    }
    else {
      resolved.shootVel = new std_msgs.msg.UInt8()
    }

    return resolved;
    }
};

module.exports = WaypointMission;
