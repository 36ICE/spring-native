package com.example.events;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

@Component
public class CLR implements CommandLineRunner {
	
	@Autowired
	public SamplePublisher publisher;

	@Override
	public void run(String... args) throws Exception {
		System.out.println("event application running!");
		publisher.publishCustomEvent();
		publisher.nonTransactionalPublishCustomEvent();
	}
	
}
