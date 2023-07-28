package com.group5.b2c.scheduler;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.group5.b2c.model.Rental;
import com.group5.b2c.repository.RentalRepository;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class Schedule {
	private final RentalRepository rentalRepository;
	
	//자정에 대여미납
	@Transactional
	@Scheduled(cron = "0 0 0 * * ?")
    public void testSchedule() {
		System.out.println("scheduler active");
		List<Rental> list = rentalRepository.findAllByReturndateBeforeAndRentstatus(new Date(),"rent");
		for(Rental rental : list) {
			rental.setRentstatus("overdue");
		}
    }
}
