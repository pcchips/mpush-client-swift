//
//  HttpRequestMessage.swift
//  mpush_client
//
//  Created by ohun on 16/6/21.
//  Copyright © 2016年 mpusher. All rights reserved.
//

import Foundation

class HttpRequestMessage: ByteBufMessage, CustomDebugStringConvertible {
    
    var method: Int8!;
    var uri: String!;
    var headers: Dictionary<String,String>!;
    var body:Data?;
    
    init(connection: Connection) {
        super.init(packet: Packet(cmd: Command.http_PROXY, sessionId: BaseMessage.genSessionId()), conn: connection);
    }
    
    override func encode(_ body:RFIWriter){
        body.writeByte(method);
        body.write(uri)
        body.write(MPUtils.headerToString(headers))
        body.writeData(self.body)
    }
    
    var debugDescription: String {
        return "HttpRequestMessage={method:\(method), uri=\(uri), headers=\(headers), body=\(body)}"
    }
}
