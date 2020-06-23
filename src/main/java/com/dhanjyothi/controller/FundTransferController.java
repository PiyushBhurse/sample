package com.dhanjyothi.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.dhanjyothi.model.Beneficiaries;
import com.dhanjyothi.model.Transaction;

@Controller
public class FundTransferController {

	@GetMapping("/loadbeneficiary")
	public String loadBeneficiaryPage() {
		return null;
	}

	@GetMapping("/loadtransfer")
	public String loadTransferPage(@ModelAttribute("transaction") Transaction transaction, Model model,
			HttpServletRequest request) {
		return null;
	}

	@GetMapping("/beneficiarywithinbank")
	public String beneficiarywithinbank(@ModelAttribute("beneficiary") Beneficiaries beneficiary, Model model) {

		return null;
	}

	@GetMapping("/beneficiaryotherbank")
	public String beneficiaryotherbank(@ModelAttribute("beneficiary") Beneficiaries beneficiary, Model model) {

		return null;
	}

	@PostMapping("/savebeneficiary")
	public String saveBeneficiary(@ModelAttribute("beneficiary") Beneficiaries beneficiary, Model model,
			BindingResult bindingResult, HttpServletRequest request) {
		return null;
	}

	@PostMapping("/transferamt")
	public String transferAmount(@ModelAttribute("transaction") Transaction transaction, Model model,
			BindingResult bindingResult, HttpServletRequest request) {
		return null;
	}
}
