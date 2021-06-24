// Auto-generated. Do not edit!

// (in-package custom_services.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class MeanThreeIntsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.a = null;
      this.b = null;
      this.c = null;
    }
    else {
      if (initObj.hasOwnProperty('a')) {
        this.a = initObj.a
      }
      else {
        this.a = 0;
      }
      if (initObj.hasOwnProperty('b')) {
        this.b = initObj.b
      }
      else {
        this.b = 0;
      }
      if (initObj.hasOwnProperty('c')) {
        this.c = initObj.c
      }
      else {
        this.c = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MeanThreeIntsRequest
    // Serialize message field [a]
    bufferOffset = _serializer.int64(obj.a, buffer, bufferOffset);
    // Serialize message field [b]
    bufferOffset = _serializer.int64(obj.b, buffer, bufferOffset);
    // Serialize message field [c]
    bufferOffset = _serializer.int64(obj.c, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MeanThreeIntsRequest
    let len;
    let data = new MeanThreeIntsRequest(null);
    // Deserialize message field [a]
    data.a = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [b]
    data.b = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [c]
    data.c = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'custom_services/MeanThreeIntsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c8559b52d432bccd240703f31aeca517';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 a
    int64 b
    int64 c
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MeanThreeIntsRequest(null);
    if (msg.a !== undefined) {
      resolved.a = msg.a;
    }
    else {
      resolved.a = 0
    }

    if (msg.b !== undefined) {
      resolved.b = msg.b;
    }
    else {
      resolved.b = 0
    }

    if (msg.c !== undefined) {
      resolved.c = msg.c;
    }
    else {
      resolved.c = 0
    }

    return resolved;
    }
};

class MeanThreeIntsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mean = null;
    }
    else {
      if (initObj.hasOwnProperty('mean')) {
        this.mean = initObj.mean
      }
      else {
        this.mean = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MeanThreeIntsResponse
    // Serialize message field [mean]
    bufferOffset = _serializer.float64(obj.mean, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MeanThreeIntsResponse
    let len;
    let data = new MeanThreeIntsResponse(null);
    // Deserialize message field [mean]
    data.mean = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'custom_services/MeanThreeIntsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '553f1cf790d28bd4944c3f5348101e80';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 mean
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MeanThreeIntsResponse(null);
    if (msg.mean !== undefined) {
      resolved.mean = msg.mean;
    }
    else {
      resolved.mean = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: MeanThreeIntsRequest,
  Response: MeanThreeIntsResponse,
  md5sum() { return 'f30a58e2837f4b803e4927983e2be21f'; },
  datatype() { return 'custom_services/MeanThreeInts'; }
};
