package com.dhanjyothi.util;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

public class DhanJyothiUtil {

	public static Map<Integer, String> getTenureDetails() {
		Map<Integer, String> map = new LinkedHashMap<>();
		map.put(1, "One Year");
		map.put(2, "Two Year");
		map.put(3, "Three Year");
		map.put(4, "Four Year");
		map.put(5, "Five Year");
		return map;
	}

	public static Date getCurrentDate() {
		Date date = java.util.Calendar.getInstance().getTime();
		return date;
	}

	public static double calculateMaturityAmount(long p, int t, float r) {
		double ciAmt = p * (Math.pow((1 + r / 100), t));
		ciAmt = (double) Math.round(ciAmt * 100) / 100;
		return ciAmt;
	}

	public static float getInterstRate(int tenure, long amount) {
		float interest = 0.0f;
		if (tenure == 1) {
			if (amount <= 100000) {
				interest = 5.75f;
			} else if (amount <= 1000000) {
				interest = 6.00f;
			} else if (amount >= 1000000 && amount <= 10000000) {
				interest = 6.25f;
			} else {
				interest = 0.0f;
			}

		} else if (tenure == 2) {
			if (amount <= 100000) {
				interest = 5.75f;
			} else if (amount <= 1000000) {
				interest = 6.00f;
			} else if (amount >= 1000000 && amount <= 10000000) {
				interest = 6.50f;
			} else {
				interest = 0.0f;
			}

		} else if (tenure == 3) {
			if (amount <= 100000) {
				interest = 5.75f;
			} else if (amount <= 1000000) {
				interest = 6.25f;
			} else if (amount >= 1000000 && amount <= 10000000) {
				interest = 6.75f;
			} else {
				interest = 0.0f;
			}

		} else if (tenure == 4) {
			if (amount <= 100000) {
				interest = 6.00f;
			} else if (amount <= 1000000) {
				interest = 6.25f;
			} else if (amount >= 1000000 && amount <= 10000000) {
				interest = 6.75f;
			} else {
				interest = 0.0f;
			}

		} else if (tenure == 5) {
			if (amount <= 100000) {
				interest = 6.00f;
			} else if (amount <= 1000000) {
				interest = 6.50f;
			} else if (amount >= 1000000 && amount <= 10000000) {
				interest = 7.00f;
			} else {
				interest = 0.0f;
			}

		} else {
			interest = 0.0f;
		}

		return interest;
	}

	public static Map<Integer, String> getChequeRequestList() {
		Map<Integer, String> map = new LinkedHashMap<>();
		map.put(20, "100 Leaves");// cheque leaves vs charges
		map.put(50, "200 Leaves");
		map.put(100, "300 Leaves");
		return map;
	}

}
