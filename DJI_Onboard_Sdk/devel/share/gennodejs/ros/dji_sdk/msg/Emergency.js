// Auto-generated. Do not edit!

// (in-package dji_sdk.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class Emergency {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.home = null;
      this.land = null;
      this.hover = null;
      this.takeOff = null;
    }
    else {
      if (initObj.hasOwnProperty('home')) {
        this.home = initObj.home
      }
      else {
        this.home = new std_msgs.msg.UInt8();
      }
      if (initObj.hasOwnProperty('land')) {
        this.land = initObj.land
      }
      else {
        this.land = new std_msgs.msg.UInt8();
      }
      if (initObj.hasOwnProperty('hover')) {
        this.hover = initObj.hover
      }
      else {
        this.hover = new std_msgs.msg.UInt8();
      }
      if (initObj.hasOwnProperty('takeOff')) {
        this.takeOff = initObj.takeOff
      }
      else {
        this.takeOff = new std_msgs.msg.UInt8();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Emergency
    // Serialize message field [home]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.home, buffer, bufferOffset);
    // Serialize message field [land]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.land, buffer, bufferOffset);
    // Serialize message field [hover]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.hover, buffer, bufferOffset);
    // Serialize message field [takeOff]
    bufferOffset = std_msgs.msg.UInt8.serialize(obj.takeOff, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Emergency
    let len;
    let data = new Emergency(null);
    // Deserialize message field [home]
    data.home = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [land]
    data.land = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [hover]
    data.hover = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    // Deserialize message field [takeOff]
    data.takeOff = std_msgs.msg.UInt8.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dji_sdk/Emergency';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1d411b8cc595547a01bef8995efbdc30';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/UInt8 home
    std_msgs/UInt8 land
    std_msgs/UInt8 hover
    std_msgs/UInt8 takeOff
    
    ================================================================================
    MSG: std_msgs/UInt8
    uint8 data
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Emergency(null);
    if (msg.home !== undefined) {
      resolved.home = std_msgs.msg.UInt8.Resolve(msg.home)
    }
    else {
      resolved.home = new std_msgs.msg.UInt8()
    }

    if (msg.land !== undefined) {
      resolved.land = std_msgs.msg.UInt8.Resolve(msg.land)
    }
    else {
      resolved.land = new std_msgs.msg.UInt8()
    }

    if (msg.hover !== undefined) {
      resolved.hover = std_msgs.msg.UInt8.Resolve(msg.hover)
    }
    else {
      resolved.hover = new std_msgs.msg.UInt8()
    }

    if (msg.takeOff !== undefined) {
      resolved.takeOff = std_msgs.msg.UInt8.Resolve(msg.takeOff)
    }
    else {
      resolved.takeOff = new std_msgs.msg.UInt8()
    }

    return resolved;
    }
};

module.exports = Emergency;
