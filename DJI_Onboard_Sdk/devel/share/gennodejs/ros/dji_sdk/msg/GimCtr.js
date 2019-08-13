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
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class GimCtr {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pry = null;
      this.mutiple = null;
      this.setFcus = null;
      this.reset = null;
      this.sos = null;
      this.sor = null;
    }
    else {
      if (initObj.hasOwnProperty('pry')) {
        this.pry = initObj.pry
      }
      else {
        this.pry = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('mutiple')) {
        this.mutiple = initObj.mutiple
      }
      else {
        this.mutiple = new std_msgs.msg.Int32();
      }
      if (initObj.hasOwnProperty('setFcus')) {
        this.setFcus = initObj.setFcus
      }
      else {
        this.setFcus = new std_msgs.msg.Int32();
      }
      if (initObj.hasOwnProperty('reset')) {
        this.reset = initObj.reset
      }
      else {
        this.reset = new std_msgs.msg.Int32();
      }
      if (initObj.hasOwnProperty('sos')) {
        this.sos = initObj.sos
      }
      else {
        this.sos = new std_msgs.msg.Int32();
      }
      if (initObj.hasOwnProperty('sor')) {
        this.sor = initObj.sor
      }
      else {
        this.sor = new std_msgs.msg.Int32();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GimCtr
    // Serialize message field [pry]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.pry, buffer, bufferOffset);
    // Serialize message field [mutiple]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.mutiple, buffer, bufferOffset);
    // Serialize message field [setFcus]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.setFcus, buffer, bufferOffset);
    // Serialize message field [reset]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.reset, buffer, bufferOffset);
    // Serialize message field [sos]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.sos, buffer, bufferOffset);
    // Serialize message field [sor]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.sor, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GimCtr
    let len;
    let data = new GimCtr(null);
    // Deserialize message field [pry]
    data.pry = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [mutiple]
    data.mutiple = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    // Deserialize message field [setFcus]
    data.setFcus = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    // Deserialize message field [reset]
    data.reset = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    // Deserialize message field [sos]
    data.sos = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    // Deserialize message field [sor]
    data.sor = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 44;
  }

  static datatype() {
    // Returns string type for a message object
    return 'dji_sdk/GimCtr';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '884bd8fe246ac26d7bb87013a1d884c1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point pry
    std_msgs/Int32 mutiple
    std_msgs/Int32 setFcus
    std_msgs/Int32 reset
    std_msgs/Int32 sos
    std_msgs/Int32 sor
    		
    
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: std_msgs/Int32
    int32 data
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GimCtr(null);
    if (msg.pry !== undefined) {
      resolved.pry = geometry_msgs.msg.Point.Resolve(msg.pry)
    }
    else {
      resolved.pry = new geometry_msgs.msg.Point()
    }

    if (msg.mutiple !== undefined) {
      resolved.mutiple = std_msgs.msg.Int32.Resolve(msg.mutiple)
    }
    else {
      resolved.mutiple = new std_msgs.msg.Int32()
    }

    if (msg.setFcus !== undefined) {
      resolved.setFcus = std_msgs.msg.Int32.Resolve(msg.setFcus)
    }
    else {
      resolved.setFcus = new std_msgs.msg.Int32()
    }

    if (msg.reset !== undefined) {
      resolved.reset = std_msgs.msg.Int32.Resolve(msg.reset)
    }
    else {
      resolved.reset = new std_msgs.msg.Int32()
    }

    if (msg.sos !== undefined) {
      resolved.sos = std_msgs.msg.Int32.Resolve(msg.sos)
    }
    else {
      resolved.sos = new std_msgs.msg.Int32()
    }

    if (msg.sor !== undefined) {
      resolved.sor = std_msgs.msg.Int32.Resolve(msg.sor)
    }
    else {
      resolved.sor = new std_msgs.msg.Int32()
    }

    return resolved;
    }
};

module.exports = GimCtr;
