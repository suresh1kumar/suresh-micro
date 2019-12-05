package com.springboot.tranSaction.app.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class User {
		
		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		@Column(name="user_id")
		private long userId;
		
		@Column(name="user_name")
		private String userName;
		
		@Column(name="booking_date")
		private Date bookingDate;
		
		@Column(name="source_station")
		private String sourceStation;
		
		@Column(name="dest_station")
		private String destStation;
		
		@Column(name="email")
		private String email;
		
		public User() {
			super();
			// TODO Auto-generated constructor stub
		}

		public long getUserId() {
			return userId;
		}

		public void setUserId(long userId) {
			this.userId = userId;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public Date getBookingDate() {
			return bookingDate;
		}

		public void setBookingDate(Date bookingDate) {
			this.bookingDate = bookingDate;
		}

		public String getSourceStation() {
			return sourceStation;
		}

		public void setSourceStation(String sourceStation) {
			this.sourceStation = sourceStation;
		}

		public String getDestStation() {
			return destStation;
		}

		public void setDestStation(String destStation) {
			this.destStation = destStation;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		@Override
		public String toString() {
			return "User [userId=" + userId + ", userName=" + userName + ", bookingDate=" + bookingDate
					+ ", sourceStation=" + sourceStation + ", destStation=" + destStation + ", email=" + email + "]";
		}

		


    
}
