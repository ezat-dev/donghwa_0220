package com.ace.async;

import java.util.concurrent.ExecutionException;

import org.eclipse.milo.opcua.stack.core.UaException;
import org.springframework.scheduling.annotation.Scheduled;

import com.ace.controller.MainController;


public class OpcComprocessor {

	//1초주기로 OPC UA 커넥션이 null일경우 연결
	@Scheduled(fixedRate = 1000)
	public void handle() throws UaException, InterruptedException, ExecutionException {
		if(MainController.client == null) {
			MainController.opcStart();
		}		
	}
}
