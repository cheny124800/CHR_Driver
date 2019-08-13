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

class HotpointMission {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.missionIndex = null;
      this.hotpoint = null;
      this.startHotPoint = null;
      this.headingMode = null;
      this.altitude = null;
      this.angleVel = null;
      this.radius = null;
      this.gimbalAngle = null;
      this.clockwise = null;
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
      if (initObj.hasOwnProperty('hotpoint')) {
        this.hotpoint = initObj.hotpoint
      }
      else {
        this.hotpoint = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('startHotPoint')) {
        this.startHotPoint = initObj.startHotPoint
      }
      else {
        this.startHotPoint = new std_msgs.msg.UInt8();
      }
      if (initObj.hasOwnProperty('headingMode')) {
        this.headingMode = initObj.headingMode
      }
      else {
        this.headingMode = new std_msgs.msg.UInt8();
      }
      if (initObj.hasOwnProperty('altitude')) {
        this.altitude = initObj.altitude
      }
      else {
        this.altitude = new std_msgs.msg.UInt16();
      }
      if (initObj.hasOwnProperty('angleVel')) {
        this.angleVel = initObj.angleVel
      }
      else {
        this.angleVel = new std_msgs.msg.UInt8();
      }
      if (initObj.hasOwnProperty('radius')) {
        this.radius = initObj.radius
      }
      else {
        this.radius = new std_msgs.msg.UInt16();
      }
      if (initObj.hasOwnProperty('gimbalAngle')) {
        this.gimbalAngle = initObj.gimbalAngle
      }
      else {
        this.gimbalAngle = new std_msgs.msg.Int16();
      }
      if (initObj.hasOwnProperty('clockwise')) {
        this.clockwise = initObj.clockwise
      }
      else {
        this.clockwise = new std_msgs.msg.UInt8();
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
    // Serializes a message object of type HotpointMission
    // Serialize message field [missionIndex]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.missionIndex, buffer, bufferOffset);
    // Serialize message field [hotpoint]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.hotpoint, buffer, bufferOffset);
    // Serialize message field [startHotPoint]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.startHotPoint, buffer, bufferOffset);
    // Serialize message field [headingMode]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.headingMode, buffer, bufferOffset);
    // Serialize message field [altitude]
    bufferOffset = std_msgs.msg.UInt16.serialize(obj.altitude, buffer, bufferOffset);
    // Serialize message field [angleVel]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.angleVel, buffer, bufferOffset);
    // Serialize message field [radius]
    bufferOffset = std_msgs.msg.UInt16.serialize(obj.radius, buffer, bufferOffset);
    // Serialize message field [gimbalAngle]
    bufferOffset = std_msgs.msg.Int16.serialize(obj.gimbalAngle, buffer, bufferOffset);
    // Serialize message field [clockwise]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.clockwise, buffer, bufferOffset);
    // Serialize message field [isUseCam]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.isUseCam, buffer, bufferOffset);
    // Serialize message field [sor]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.sor, buffer, bufferOffset);
    // Serialize message field [shootVel]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.shootVel, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type HotpointMission
    let len;
    let data = new HotpointMission(null);
    // Deserialize message field [missionIndex]
    data.missionIndex = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [hotpoint]
    data.hotpoint = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [startHotPoint]
    data.startHotPoint = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [headingMode]
    data.headingMode = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [altitude]
    data.altitude = std_msgs.msg.UInt16.deserialize(buffer, bufferOffset);
    // Deserialize message field [angleVel]
    data.angleVel = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [radius]
    data.radius = std_msgs.msg.UInt16.deserialize(buffer, bufferOffset);
    // Deserialize message field [gimbalAngle]
    data.gimbalAngle = std_msgs.msg.Int16.deserialize(buffer, bufferOffset);
    // Deserialize message field [clockwise]
    data.clockwise = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [isUseCam]
    data.isUseCam = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [sor]
    data.sor = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [shootVel]
    data.shootVel = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 38;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dji_sdk/HotpointMission';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1275f1566cde5c929e0caa2875c0e3c4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/UInt8 missionIndex
    geometry_msgs/Point hotpoint
    std_msgs/UInt8 startHotPoint
    std_msgs/UInt8 headingMode
    std_msgs/UInt16 altitude
    std_msgs/UInt8 angleVel
    std_msgs/UInt16 radius
    std_msgs/Int16 gimbalAngle
    std_msgs/UInt8 clockwise
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
    const resolved = new HotpointMission(null);
    if (msg.missionIndex !== undefined) {
      resolved.missionIndex = std_msgs.msg.UInt8.Resolve(msg.missionIndex)
    }
    else {
      resolved.missionIndex = new std_msgs.msg.UInt8()
    }

    if (msg.hotpoint !== undefined) {
      resolved.hotpoint = geometry_msgs.msg.Point.Resolve(msg.hotpoint)
    }
    else {
      resolved.hotpoint = new geometry_msgs.msg.Point()
    }

    if (msg.startHotPoint !== undefined) {
      resolved.startHotPoint = std_msgs.msg.UInt8.Resolve(msg.startHotPoint)
    }
    else {
      resolved.startHotPoint = new std_msgs.msg.UInt8()
    }

    if (msg.headingMode !== undefined) {
      resolved.headingMode = std_msgs.msg.UInt8.Resolve(msg.headingMode)
    }
    else {
      resolved.headingMode = new std_msgs.msg.UInt8()
    }

    if (msg.altitude !== undefined) {
      resolved.altitude = std_msgs.msg.UInt16.Resolve(msg.altitude)
    }
    else {
      resolved.altitude = new std_msgs.msg.UInt16()
    }

    if (msg.angleVel !== undefined) {
      resolved.angleVel = std_msgs.msg.UInt8.Resolve(msg.angleVel)
    }
    else {
      resolved.angleVel = new std_msgs.msg.UInt8()
    }

    if (msg.radius !== undefined) {
      resolved.radius = std_msgs.msg.UInt16.Resolve(msg.radius)
    }
    else {
      resolved.radius = new std_msgs.msg.UInt16()
    }

    if (msg.gimbalAngle !== undefined) {
      resolved.gimbalAngle = std_msgs.msg.Int16.Resolve(msg.gimbalAngle)
    }
    else {
      resolved.gimbalAngle = new std_msgs.msg.Int16()
    }

    if (msg.clockwise !== undefined) {
      resolved.clockwise = std_msgs.msg.UInt8.Resolve(msg.clockwise)
    }
    else {
      resolved.clockwise = new std_msgs.msg.UInt8()
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

module.exports = HotpointMission;
