// Auto-generated. Do not edit!

// (in-package roblink_driver.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class GimbalCtl {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pitch = null;
      this.yaw = null;
      this.zoom = null;
      this.focus = null;
      this.home = null;
      this.TakePicture = null;
      this.cameraModeChange = null;
      this.yawfollow = null;
    }
    else {
      if (initObj.hasOwnProperty('pitch')) {
        this.pitch = initObj.pitch
      }
      else {
        this.pitch = 0.0;
      }
      if (initObj.hasOwnProperty('yaw')) {
        this.yaw = initObj.yaw
      }
      else {
        this.yaw = 0.0;
      }
      if (initObj.hasOwnProperty('zoom')) {
        this.zoom = initObj.zoom
      }
      else {
        this.zoom = 0.0;
      }
      if (initObj.hasOwnProperty('focus')) {
        this.focus = initObj.focus
      }
      else {
        this.focus = 0.0;
      }
      if (initObj.hasOwnProperty('home')) {
        this.home = initObj.home
      }
      else {
        this.home = 0;
      }
      if (initObj.hasOwnProperty('TakePicture')) {
        this.TakePicture = initObj.TakePicture
      }
      else {
        this.TakePicture = 0;
      }
      if (initObj.hasOwnProperty('cameraModeChange')) {
        this.cameraModeChange = initObj.cameraModeChange
      }
      else {
        this.cameraModeChange = 0;
      }
      if (initObj.hasOwnProperty('yawfollow')) {
        this.yawfollow = initObj.yawfollow
      }
      else {
        this.yawfollow = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GimbalCtl
    // Serialize message field [pitch]
    bufferOffset = _serializer.float32(obj.pitch, buffer, bufferOffset);
    // Serialize message field [yaw]
    bufferOffset = _serializer.float32(obj.yaw, buffer, bufferOffset);
    // Serialize message field [zoom]
    bufferOffset = _serializer.float32(obj.zoom, buffer, bufferOffset);
    // Serialize message field [focus]
    bufferOffset = _serializer.float32(obj.focus, buffer, bufferOffset);
    // Serialize message field [home]
    bufferOffset = _serializer.uint16(obj.home, buffer, bufferOffset);
    // Serialize message field [TakePicture]
    bufferOffset = _serializer.uint16(obj.TakePicture, buffer, bufferOffset);
    // Serialize message field [cameraModeChange]
    bufferOffset = _serializer.uint16(obj.cameraModeChange, buffer, bufferOffset);
    // Serialize message field [yawfollow]
    bufferOffset = _serializer.uint16(obj.yawfollow, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GimbalCtl
    let len;
    let data = new GimbalCtl(null);
    // Deserialize message field [pitch]
    data.pitch = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [yaw]
    data.yaw = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [zoom]
    data.zoom = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [focus]
    data.focus = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [home]
    data.home = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [TakePicture]
    data.TakePicture = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [cameraModeChange]
    data.cameraModeChange = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [yawfollow]
    data.yawfollow = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'roblink_driver/GimbalCtl';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3da712e93e361ce644847f1c37d59c65';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 pitch
    float32 yaw
    float32 zoom
    float32 focus
    uint16  home
    uint16  TakePicture
    uint16  cameraModeChange
    uint16  yawfollow
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GimbalCtl(null);
    if (msg.pitch !== undefined) {
      resolved.pitch = msg.pitch;
    }
    else {
      resolved.pitch = 0.0
    }

    if (msg.yaw !== undefined) {
      resolved.yaw = msg.yaw;
    }
    else {
      resolved.yaw = 0.0
    }

    if (msg.zoom !== undefined) {
      resolved.zoom = msg.zoom;
    }
    else {
      resolved.zoom = 0.0
    }

    if (msg.focus !== undefined) {
      resolved.focus = msg.focus;
    }
    else {
      resolved.focus = 0.0
    }

    if (msg.home !== undefined) {
      resolved.home = msg.home;
    }
    else {
      resolved.home = 0
    }

    if (msg.TakePicture !== undefined) {
      resolved.TakePicture = msg.TakePicture;
    }
    else {
      resolved.TakePicture = 0
    }

    if (msg.cameraModeChange !== undefined) {
      resolved.cameraModeChange = msg.cameraModeChange;
    }
    else {
      resolved.cameraModeChange = 0
    }

    if (msg.yawfollow !== undefined) {
      resolved.yawfollow = msg.yawfollow;
    }
    else {
      resolved.yawfollow = 0
    }

    return resolved;
    }
};

module.exports = GimbalCtl;
