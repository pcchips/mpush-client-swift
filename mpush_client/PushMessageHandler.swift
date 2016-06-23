//
//  PushMessageHandler.swift
//  mpush_client
//
//  Created by ohun on 16/6/20.
//  Copyright © 2016年 mpusher. All rights reserved.
//

import Foundation

final class PushMessageHandler: BaseMessageHandler<PushMessage> {
    
    override func decode(packet:Packet, connection:Connection) -> PushMessage {
        return PushMessage(packet: packet, conn: connection);
    }
    
    override func handle(message: PushMessage) {
        ClientConfig.I.logger.w({">>> receive push message=\(message)"});
        let listener = ClientConfig.I.clientListener;
        listener.onReceivePush(message.getConnection().client, content: message.content);
    }
}