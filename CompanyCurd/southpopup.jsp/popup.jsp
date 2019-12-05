<%@ page
	import="com.mobitec.Mvoucher.*,java.sql.Connection,java.sql.Connection,java.util.*"%>
<%@page import="javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml2/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

<HEAD>
<TITLE>Menu</TITLE>
<script type="text/javascript" src="jquery.min.js"></script>

<script type="text/javascript" src="ddaccordion.js">
	
</script>


<style type="text/css">
.technology { /*header of 2nd demo*/
	cursor: hand;
	cursor: pointer;
	font: bold 12px Verdana;
	margin: 10px 0;
}

.openlanguage {
	/*class added to contents of 2nd demo when they are open*/
	color: blue;
}

.closedlanguage {
	/*class added to contents of 2nd demo when they are closed*/
	color: blue;
}

#contentDiv {
	background-color: #CEECF5;
}
</style>





<script language="JavaScript">
	ddaccordion.init({
		headerclass : "technology", //Shared CSS class name of headers group
		contentclass : "thelanguage", //Shared CSS class name of contents group
		revealtype : "click", //Reveal content when user clicks or onmouseover the header? Valid value: "click", "clickgo", or "mouseover"
		mouseoverdelay : 50, //if revealtype="mouseover", set delay in milliseconds before header expands onMouseover
		collapseprev : false, //Collapse previous content (so only one open at any time)? true/false 
		defaultexpanded : [], //index of content(s) open by default [index1, index2, etc]. [] denotes no content.
		onemustopen : false, //Specify whether at least one header should be open always (so never all headers closed)
		animatedefault : false, //Should contents open by default be animated into view?
		scrolltoheader : false, //scroll to header each time after it's been expanded by the user?
		persiststate : false, //persist state of opened contents within browser session?
		toggleclass : [ "closedlanguage", "openlanguage" ], //Two CSS classes to be applied to the header when it's collapsed and expanded, respectively ["class1", "class2"]
		togglehtml : [ ,
				"<img src='sample1_sub_bg.gif' style='width:40px ' /> ",
				"<img src='sample1_sub_bg.gif' style='width:40px' /> " ], //Additional HTML added to the header when it's collapsed and expanded, respectively  ["position", "html1", "html2"] (see docs)

		animatespeed : "fast", //speed of animation: integer in milliseconds (ie: 200), or keywords "fast", "normal", or "slow"
		oninit : function(expandedindices) { //custom code to run when headers have initalized
			//do nothing
		},
		onopenclose : function(header, index, state, isuseractivated) { //custom code to run whenever a header is opened or closed
			//do nothing
		}
	})
</Script>

</HEAD>
<div style="overflow: auto; width: 200px; height: 500px">
	<BODY background="images/logo_left'.gif" width="30" gradientType='0'
		" leftmargin="3" topmargin="3" marginwidth="0" marginheight="0">


		<%
			String userName = (String) session.getAttribute("user_id");
			String password = (String) session.getAttribute("password");
			int userLevel = 5;
			int userLevelc = 0;
			int intCount = 0;
			int intView = 0;
			String strAdd = "";
			String strModify = "";
			String strDelete = "";
			String strPrntSave = "";
			StringTokenizer st = null;
			StringTokenizer st1 = null;
			StringTokenizer st2 = null;
			String Slist = "";
			String strPrivilage = "";
			LoginAuth auth = new LoginAuth();

			ScreenList SL = new ScreenList();
			Slist = SL.getScreenList(userName);

			//if(Slist != null && !Slist.equalsIgnoreCase("")){
			st = new StringTokenizer(Slist, "~");
			intCount = st.countTokens();
			String[] strScreenId = new String[intCount];
			String[] strScreenName = new String[intCount];

			if (Slist != null && !Slist.equalsIgnoreCase("")) {
				for (int i = 0; i < intCount; i++) {
					st1 = new StringTokenizer(st.nextToken(), "#");
					while (st1.hasMoreTokens()) {
						strScreenId[i] = st1.nextToken();
						strScreenName[i] = st1.nextToken();
					}
				}
			}
		%>




		<!--------Start Menu---------->
		<%
			int intDM1 = 0;
			int intDM2 = 0;
			int intDM3 = 0;
			int intDM4 = 0;
			int intDM6 = 0;
			int intDM13 = 0; //FOR SYNCING DEALER DATA IN SPEEDPAY
			if (Slist != null && !Slist.equalsIgnoreCase("")) {
				for (int i = 0; i < strScreenId.length; i++) {
					if (strScreenId[i].equalsIgnoreCase("DM1")
							|| strScreenId[i].equalsIgnoreCase("DM2")
							|| strScreenId[i].equalsIgnoreCase("DM3")
							|| strScreenId[i].equalsIgnoreCase("DM4")
							|| strScreenId[i].equalsIgnoreCase("DM6")
							|| strScreenId[i].equalsIgnoreCase("DM13")) {
						if (strScreenId[i].equalsIgnoreCase("DM1")) {
							intDM1 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("DM2")) {
							intDM2 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("DM3")) {
							intDM3 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("DM4")) {
							intDM4 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("DM6")) {
							intDM6 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("DM13")) {
							intDM13 = 1;
						}
					}
				}
				if (intDM1 == 1 || intDM2 == 1 || intDM3 == 1 || intDM4 == 1
						|| intDM6 == 1 || intDM13 == 1) {
		%>
		<div class="technology">Franchise Management</div>
		<div class="thelanguage">
			<div id="contentDiv">



				<%
					for (int i = 0; i < strScreenName.length; i++) {
								if (strScreenName[i].equalsIgnoreCase("Add Franchise")) {
				%>
				<span class="subItem"><a href="DealerManagement/Add.jsp"
					target="right"> <font size="1.5">Add</font>
				</a>
				</span><BR />
				<%
					}

								if (strScreenName[i].equalsIgnoreCase("Search")) {
				%>
				<span class="subItem"><a
					href="DealerManagement/SearchDealerInfo.jsp" target="right"> <font
						size="1.5">Search</font>
				</a>
				</span><BR />
				<%
					}

				/* For Syncing dealer data in retailer table */

				if (strScreenName[i].equalsIgnoreCase("SyncDealerData")) {
				%>
				<span class="subItem"><a
					href="DealerManagement/DealerDataSync.jsp" target="right"> <font
						size="1.5">Sync Dealer Data</font>
				</a>
				</span><BR />
				<%
					}


								if (strScreenName[i]
										.equalsIgnoreCase("Franchise Addition Report")) {
				%>
				<span class="subItem"><a
					href="DealerManagement/DealerAddition.jsp" target="right"> <font
						size="1.5">Franchise Creation Report</font>
				</a>
				</span><BR />
				<%
					}

								if (strScreenName[i]
										.equalsIgnoreCase("Bulk Activation/DeActivation")) {
				%>
				<span class="subItem"><a
					href="DealerManagement/BulkActivationDlr.jsp" target="right"> <font
						size="1.5">Bulk Activation/DeActivation</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("bulkDealerUpload")) {
				%>
				<span class="subItem"><a
					href="DealerManagement/bulkDealerUpload.jsp" target="right"> <font
						size="1.5">Bulk Dealer Upload</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("DealerHierarchyChange")) {
				%>
				<span class="subItem"><a
					href="DealerManagement/DealerHierarchyChange.jsp" target="right">
						<font size="1.5">Dealer Hierarchy Change</font>
				</a>
				</span><BR />
				<%
					}

							}
				%>
			</div>
		</div>

		<%
			}
			}
		%>
		<!--------End Menu------------>

		<!--------Start Menu---------->
		<%
			int intWH1 = 0;
			//int intWH2 = 0;
			//int intWH3 = 0;
			//int intWH4 = 0;
			int intWH5 = 0;
			int intWH7 = 0;
			int intWH8 = 0;
			int intWH9 = 0;
			int intWH10 = 0;
			int intWH11 = 0;
			int intWH13 = 0;
			int intWH14 = 0;
			int intWH15 = 0;
			int intWH17 = 0;
			int intWH18 = 0;
			int intWH19 = 0;
			int intWH23 = 0;
			int intWH24 = 0;
			int intWH27 = 0;
			int intWH34 = 0;
			int intWH31 = 0;
			int intWH28 = 0; //for vanity number sales reversal
			if (Slist != null && !Slist.equalsIgnoreCase("")) {
				for (int i = 0; i < strScreenId.length; i++) {
					if (strScreenId[i].equalsIgnoreCase("WH1")
							|| strScreenId[i].equalsIgnoreCase("WH5")
							|| strScreenId[i].equalsIgnoreCase("WH7")
							|| strScreenId[i].equalsIgnoreCase("WH8")
							|| strScreenId[i].equalsIgnoreCase("WH9")
							|| strScreenId[i].equalsIgnoreCase("WH10")
							|| strScreenId[i].equalsIgnoreCase("WH11")
							|| strScreenId[i].equalsIgnoreCase("WH13")
							|| strScreenId[i].equalsIgnoreCase("WH14")
							|| strScreenId[i].equalsIgnoreCase("WH17")
							|| strScreenId[i].equalsIgnoreCase("WH18")
							|| strScreenId[i].equalsIgnoreCase("WH15")
							|| strScreenId[i].equalsIgnoreCase("WH19")
							|| strScreenId[i].equalsIgnoreCase("WH23")
							|| strScreenId[i].equalsIgnoreCase("WH24")
							|| strScreenId[i].equalsIgnoreCase("WH27")
							|| strScreenId[i].equalsIgnoreCase("WH28")
							|| strScreenId[i].equalsIgnoreCase("WH34")
							|| strScreenId[i].equalsIgnoreCase("WH31")) {
						if (strScreenId[i].equalsIgnoreCase("WH1")) {
							intWH1 = 1;
						}
						/*if(strScreenId[i].equalsIgnoreCase("WH2")){
						  intWH2 = 1;
						}
						if(strScreenId[i].equalsIgnoreCase("WH3")){
						  intWH3 = 1;
						}
						if(strScreenId[i].equalsIgnoreCase("WH4")){
						  intWH4 = 1;
						} */
						if (strScreenId[i].equalsIgnoreCase("WH5")) {
							intWH5 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("WH7")) {
							intWH7 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("WH8")) {
							intWH8 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("WH9")) {
							intWH9 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("WH10")) {
							intWH10 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("WH11")) {
							intWH11 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("WH13")) {
							intWH13 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("WH14")) {
							intWH14 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("WH15")) {
							intWH15 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("WH17")) {
							intWH17 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("WH18")) {
							intWH18 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("WH19")) {
							intWH19 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("WH18")) {
							intWH23 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("WH18")) {
							intWH24 = 1;
						}
						 if(strScreenId[i].equalsIgnoreCase("WH27")){
						        intWH27 = 1;
    						}
						if(strScreenId[i].equalsIgnoreCase("WH28")){
						        intWH28 = 1;
    						}
						if(strScreenId[i].equalsIgnoreCase("WH34")){
						        intWH34 = 1;
    						}
						 if(strScreenId[i].equalsIgnoreCase("WH31")){
						        intWH31 = 1;
    						}
					}
				}
				if (intWH1 == 1 || intWH5 == 1  || intWH7 == 1  || intWH8 == 1
						|| intWH9 == 1  || intWH10 == 1 || intWH11 == 1
						|| intWH13 == 1 || intWH14 == 1 || intWH15 == 1
						|| intWH17 == 1 || intWH18 == 1 || intWH19 == 1
						|| intWH23 == 1 || intWH24 == 1 || intWH27 ==1
						|| intWH28 ==1  || intWH34 == 1 || intWH31 ==1) {
		%>

		<div class="technology">Ware House</div>
		<div class="thelanguage">
			<div id="contentDiv">
				<%
					for (int i = 0; i < strScreenName.length; i++) {
								if (strScreenName[i]
										.equalsIgnoreCase("Stock Allocation")) {
				%>
				<span class="subItem"><a
					href="WareHouse/SearchDealerInfo.jsp" target="right"><font
						size="1.5">Stock Allocation</font>
				</a>
				</span><BR />
				<%
					}

								if (strScreenName[i]
										.equalsIgnoreCase("Stock Allocation Approval")) {
				%>
				<span class="subItem"><a href="WareHouse/StockApproval.jsp"
					target="right"><font size="1.5">Stock Allocation
						Approval</font>
				</a>
				</span><BR />
				<%
					}

								if (strScreenName[i]
										.equalsIgnoreCase("Stock Allocation Receipt")) {
				%>
				<span class="subItem"><a
					href="WareHouse/SearchDealerForRecipt.jsp" target="right"><font
						size="1.5">Stock Allocation Receipt</font>
				</a>
				</span><BR />
<!-- Added by Abdul for Fee Wallet on 9-11-2017 -->
<!-- Start -->
				<%
					}

					if (strScreenName[i].equalsIgnoreCase("Fee Amount Allocation")) {
				%>
				<span class="subItem"><a href="WareHouse/CVASFeeWalletStockAllocation.jsp" target="right">
					<font size="1.5">Fee Amount Allocation</font>
				</a>
				</span><BR />
				<%
					}
					if (strScreenName[i].equalsIgnoreCase("Fee Amount Approval")) {
				%>
				<span class="subItem"><a
					href="WareHouse/CVASFeeAmountApproval.jsp" target="right"><font
						size="1.5">Fee Amount Approval</font>
				</a>
				</span><BR />
<!-- End -->
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Approved Stock Cancel")) {
				%>
				<span class="subItem"><a
					href="WareHouse/SrchDlrForStkAllocMoveCancel.jsp" target="right"><font
						size="1.5">Cancel Approved Stock</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Moved Stock Cancel")) {
				%>
				<span class="subItem"><a
					href="WareHouse/StockMovedCancel.jsp" target="right"><font
						size="1.5">Cancel Stock Movement</font>
				</a>
				</span><BR />
				<%
					}

								if (strScreenName[i]
										.equalsIgnoreCase("Recharge TopUp Reverse")) {
				%>
				<span class="subItem"><a href="WareHouse/ReverseRchTop1.jsp"
					target="right"><font size="1.5">Recharge TopUp cancel</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Recharge TopUp Reverse Update")) {
				%>
				<span class="subItem"><a href="WareHouse/ReverseRchTop2.jsp"
					target="right"><font size="1.5">Recharge TopUp cancel
						Update</font>
				</a>
				</span><BR />
				<%
					}
				/* For Vanity Number Sales Reversal */
					
				if (strScreenName[i].equalsIgnoreCase("Vanity Sales Reversal")) {
				%>
				<span class="subItem"><a href="WareHouse/VanityNumberSaleReversal.jsp"
					target="right"><font size="1.5">Vanity Sales Reversal</font>
				</a>
				</span><BR />
				<%
					}


					if(strScreenName[i].equalsIgnoreCase("Recharge TopUp Reverse Update Validity"))
				        {
				        %>
					<span class="subItem"><a href="WareHouse/ReverseUpdateValidity.jsp"  target="right"><font 						size="1.5">Recharge TopUp cancel Update Validity</font></a></span><BR />
					<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("FranchiseAddBalance")) {
				%>
				<span class="subItem"><a
					href="WareHouse/FranchiseAddBalance.jsp" target="right"><font
						size="1.5">Franchise Add Balance</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Discount Approval")) {
				%>
				<span class="subItem"><a
					href="WareHouse/discountApproval.jsp" target="right"><font
						size="1.5">Bonus Discount Approval</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("SimActivaionsApproval")) {
				%>
				<span class="subItem"><a
					href="WareHouse/simActivationsApproval.jsp" target="right"><font
						size="1.5">SIM Activations Approval</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i].equalsIgnoreCase("FRCUpload")) {
				%>
				<span class="subItem"><a href="WareHouse/FRCUpload.jsp"
					target="right"><font size="1.5"> FRC Upload </font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i].equalsIgnoreCase("FRCApproval")) {
				%>
				<span class="subItem"><a href="WareHouse/FRCApproval.jsp"
					target="right"><font size="1.5"> FRC Approval </font>
				</a>
				</span><BR />
				<%
					}

								if (strScreenName[i]
										.equalsIgnoreCase("FranchiseAddBalance")) {
				%>
				<span class="subItem"><a
					href="WareHouse/FranchiseAddBalance.jsp" target="right"><font
						size="1.5"> San Soft Approval </font>
				</a>
				</span><BR />
				<%
					}

								if (strScreenName[i]
										.equalsIgnoreCase("FranchiseBalanceAllocation")) {
				%>
				<span class="subItem"><a
					href="WareHouse/FranchiseAddBalanceAlloc.jsp" target="right"><font
						size="1.5"> San Soft Allocation </font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Retailer Bonanza Stock Allocation")) {
				%>
				<span class="subItem"><a
					href="WareHouse/RetailerBonanzaStockAllocation.jsp" target="right"><font
						size="1.5"> Retailer Bonanza Stock Allocation </font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Retailer Bonanza Stock Approve Deapprove")) {
				%>
				<span class="subItem"><a
					href="WareHouse/RetailerBonanzaStockApproveDeapprove.jsp"
					target="right"><font size="1.5"> Retailer Bonanza Stock
						Approve Deapprove </font>
				</a>
				</span><BR />
				<%
					}

								//if(strScreenName[i].equalsIgnoreCase("Load Voucher Information")){
				%>




				<!--span class="subItem"><a href="WareHouse/LoadVoucherInfo.jsp"  target="right"><font size="1.5">Load Voucher Information</font></a></span><BR /-->
				<%
					// }
								// if(strScreenName[i].equalsIgnoreCase("Unload Voucher Information")){
				%>
				<!--span class="subItem"><a href="WareHouse/UnloadVoucher.jsp"  target="right"><font size="1.5">UnLoad Voucher Information</font></a></span><BR /-->
				<%
					// }
								// if(strScreenName[i].equalsIgnoreCase("Search Voucher details")){
				%>
				<!--span class="subItem"><a href="WareHouse/SearchVoucherDetail1.jsp"  target="right"><font size="1.5">Search for Voucher Details</font></a></span-->
				<%
					// }
							}
				%>
			</div>
		</div>

		<%
			}
			}
		%>
		<!--------End Menu------------>
		<!--------Start Menu---------->
		<%
			int intRF1 = 0;
			int intRF2 = 0;
			int intRF3 = 0;
			int intRF4 = 0;
			int intRF5 = 0;
			int intRF6 = 0;
			int intRF9 = 0;
			int intRF10 = 0;
			if (Slist != null && !Slist.equalsIgnoreCase("")) {
				for (int i = 0; i < strScreenId.length; i++) {
					if (strScreenId[i].equalsIgnoreCase("RF1")
							|| strScreenId[i].equalsIgnoreCase("RF2")
							|| strScreenId[i].equalsIgnoreCase("RF3")
							|| strScreenId[i].equalsIgnoreCase("RF4")
							|| strScreenId[i].equalsIgnoreCase("RF5")
							|| strScreenId[i].equalsIgnoreCase("RF6")
							|| strScreenId[i].equalsIgnoreCase("RF9")
							|| strScreenId[i].equalsIgnoreCase("RF10")) {
						if (strScreenId[i].equalsIgnoreCase("RF1")) {
							intRF1 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RF2")) {
							intRF2 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RF3")) {
							intRF3 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RF5")) {
							intRF5 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RF4")) {
							intRF4 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RF6")) {
							intRF6 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RF9")) {
							intRF9 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RF10")) {
							intRF10 = 1;
						}
					}
				}
				if (intRF1 == 1 || intRF2 == 1 || intRF3 == 1 || intRF4 == 1
						|| intRF5 == 1 || intRF6 == 1 || intRF9 == 1
						|| intRF10 == 1) {
		%>
		<div class="technology">
			<font="2">Reference Data</font>
		</div>
		<div class="thelanguage">
			<div id="contentDiv">
				<%
					for (int i = 0; i < strScreenName.length; i++) {
								if (strScreenName[i].equalsIgnoreCase("Regions")) {
				%>
				<!--span class="subItem" classOut="subItem" classOver="subItemOver"><a href="ReferenceData/Region.jsp"  target="right"><font size="1.5">Regions</font></a></span><BR /-->
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Recharge Voucher")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="ReferenceData/RechargeVoucher.jsp" target="right"><font
						size="1.5">Recharge Voucher</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i].equalsIgnoreCase("Top Up")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="ReferenceData/TopUp.jsp" target="right"><font size="1.5">Top
						Up</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i].equalsIgnoreCase("Flexi TopUp")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="ReferenceData/FlexiTopUp.jsp" target="right"><font
						size="1.5">Flexi TopUp</font>
				</a>
				</span><BR />
				<%
					}

								if (strScreenName[i].equalsIgnoreCase("Message Master")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="ReferenceData/msgMaster.jsp" target="right"><font
						size="1.5">Message Master</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Additional Discount")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="ReferenceData/addDiscount.jsp" target="right"><font
						size="1.5">Additional Discount</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Sim Activations")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="ReferenceData/simActivations.jsp" target="right"><font
						size="1.5">SIM Sales</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("SIM Configurations")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="ReferenceData/simConfig.jsp" target="right"><font
						size="1.5">SIM Configurations</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i].equalsIgnoreCase("BlockUnblockIN")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="ReferenceData/BlockUnblockIN.jsp" target="right"><font
						size="1.5">Block Unblock IN</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("UploadIncdrFile")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="ReferenceData/UploadIncdrFile.jsp" target="right"><font
						size="1.5">Upload Incdr File</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i].equalsIgnoreCase("FileUploader")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="ReferenceData/FileUploader.jsp" target="right"><font
						size="1.5">File Uploader</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("configStarterPackDenominations")) {
				%>

				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="ReferenceData/configStarterPackDenominations.jsp"
					target="right"><font size="1.5">Starter Pack
						Denomination</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("configStarterPackCommSlabWise")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="ReferenceData/configStarterPackCommSlabWise.jsp"
					target="right"><font size="1.5">Starter Pack Commission</font>
				</a>
				</span><BR />
				<%
					}
							}
				%>
			</div>
		</div>

		<%
			}
			}
		%>
		<!--------End Menu------------>

		<!--------Start Menu---------->
		<%
			int intCM1 = 0;
			int intCM2 = 0;
			int intCM3 = 0;
			int intCM4 = 0;
			if (Slist != null && !Slist.equalsIgnoreCase("")) {
				for (int i = 0; i < strScreenId.length; i++) {
					if (strScreenId[i].equalsIgnoreCase("CM1")
							|| strScreenId[i].equalsIgnoreCase("CM2")
							|| strScreenId[i].equalsIgnoreCase("CM3")
							|| strScreenId[i].equalsIgnoreCase("CM4")) {
						if (strScreenId[i].equalsIgnoreCase("CM1")) {
							intCM1 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("CM2")) {
							intCM2 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("CM3")) {
							intCM3 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("CM4")) {
							intCM4 = 1;
						}
					}
				}
				if (intCM1 == 1 || intCM2 == 1 || intCM3 == 1 || intCM4 == 1) {
		%>
		<div class="technology">Customer Management</div>
		<div class="thelanguage">
			<div id="contentDiv">
				<%
					for (int i = 0; i < strScreenName.length; i++) {
								if (strScreenName[i]
										.equalsIgnoreCase("Pps Que Monitor")) {
				%>
				<span class="subItem"><a
					href="CustomerManagement/PPSQueMonitor.jsp" target="right"><font
						size="1.5">PPS Queue Monitor</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i].equalsIgnoreCase("SMS History")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="CustomerManagement/SmsHistory1.jsp" target="right"><font
						size="1.5">SMS History</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Subscriber Details")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="CustomerManagement/SubcriberDetails.jsp" target="right"><font
						size="1.5">Subscriber Transaction Details</font>
				</a>
				</span><BR />

				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Franchise Trans")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="CustomerManagement/DealerTrans.jsp" target="right"><font
						size="1.5">Franchise Transaction Details</font>
				</a>
				</span><BR />
				<%
					}
								//if (strScreenName[i].equalsIgnoreCase("CustomerCareForMe2U")) {
				%>

				<!-- <span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="CustomerManagement/CustomerCareForMe2U.jsp" target="right"><font
						size="1.5">Customer Care for ME2U</font> </a> </span><BR />  -->
				<%
					//}
						//		if (strScreenName[i].equalsIgnoreCase("Me2UBarUnBar")) {
				%>

				<!-- <span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="CustomerManagement/Me2UBarUnBar.jsp" target="right"><font
						size="1.5">ME2U Bar / UnBar</font> </a> </span><BR />  -->
				<%
					//}
							}
				%>
			</div>
		</div>

		<%
			}
			}
		%>
		<!--------End Menu------------>

		<!--------Start Menu---------->
		<%
			int intADM1 = 0;
			int intADM2 = 0;
			int intADM3 = 0;
			int intADM4 = 0;
			int intADM5 = 0;
			int intADM6 = 0;
			int intADM7 = 0;
			int intADM8 = 0;
			int intADM9 = 0;
			int intADM10 = 0;
			int intADM13 = 0;
			int intADM14 = 0;
			if (Slist != null && !Slist.equalsIgnoreCase("")) {
				for (int i = 0; i < strScreenId.length; i++) {
					if (strScreenId[i].equalsIgnoreCase("ADM1")
							|| strScreenId[i].equalsIgnoreCase("ADM2")
							|| strScreenId[i].equalsIgnoreCase("ADM3")
							|| strScreenId[i].equalsIgnoreCase("ADM4")
							|| strScreenId[i].equalsIgnoreCase("ADM5")
							|| strScreenId[i].equalsIgnoreCase("ADM6")
							|| strScreenId[i].equalsIgnoreCase("ADM7")
							|| strScreenId[i].equalsIgnoreCase("ADM8")
							|| strScreenId[i].equalsIgnoreCase("ADM9")
							|| strScreenId[i].equalsIgnoreCase("ADM10")
							|| strScreenId[i].equalsIgnoreCase("ADM13")
							|| strScreenId[i].equalsIgnoreCase("ADM14")) {
						if (strScreenId[i].equalsIgnoreCase("ADM1")) {
							intADM1 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("ADM2")) {
							intADM2 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("ADM3")) {
							intADM3 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("ADM4")) {
							intADM4 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("ADM5")) {
							intADM5 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("ADM6")) {
							intADM6 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("ADM7")) {
							intADM7 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("ADM8")) {
							intADM8 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("ADM9")) {
							intADM9 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("ADM10")) {
							intADM10 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("ADM13")) {
							intADM13 = 1;
						}if (strScreenId[i].equalsIgnoreCase("ADM14")) {
							intADM14 = 1;
						}
					}
				}
				if (intADM1 == 1 || intADM2 == 1 || intADM3 == 1
						|| intADM4 == 1 || intADM5 == 1 || intADM6 == 1
						|| intADM7 == 1 || intADM8 == 1 || intADM9 == 1
						|| intADM10 == 1 || intADM13 == 1 ||intADM14 == 1) {
		%>
		<div class="technology">Administration</div>
		<div class="thelanguage">
			<div id="contentDiv">
				<%
					for (int i = 0; i < strScreenName.length; i++) {
								if (strScreenName[i]
										.equalsIgnoreCase("Deafult System Setting")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Administration/SystemDefaultSetting.jsp" target="right"><font
						size="1.5">Default System Settings</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i].equalsIgnoreCase("User Manger")) {
				%>

				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Administration/UserManager2.jsp" target="right"><font
						size="1.5">User Manager</font>
				</a>
				</span><BR />

		<!--====================suresh-->
<%
					}
								if (strScreenName[i].equalsIgnoreCase("Plan Updates")) {
				%>

				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Administration/planUpdateview.jsp" target="right"><font
						size="1.5">Plan Updates</font>
				</a>
				</span><BR />
<!--=========================-->
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Profile Managment")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Administration/ProfileManagment.jsp" target="right"><font
						size="1.5">Profile Management</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i].equalsIgnoreCase("Send SMS")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Administration/Send_SMS.jsp" target="right"><font
						size="1.5">Send SMS</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Administrative SMS Flash")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Administration/Admin_SMS.jsp" target="right"><font
						size="1.5">Administrative SMS Flash</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i].equalsIgnoreCase("Zone Managment")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Administration/ZoneManagment.jsp" target="right"><font
						size="1.5">Zone Management</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Tax Configuration")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Administration/TaxConfiguration.jsp" target="right"><font
						size="1.5"> Default Tax Configuration Setting</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i].equalsIgnoreCase("Add Series")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Administration/AddSeries.jsp" target="right"><font
						size="1.5">Add Series</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i].equalsIgnoreCase("Tax Managment")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Administration/AddTaxConfig.jsp" target="right"><font
						size="1.5">Tax Management</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i].equalsIgnoreCase("Log Files")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Administration/LogFileDetailes.jsp" target="right"><font
						size="1.5">Log Files Details</font>
				</a>
				</span><BR />
				<%
					}

								if (strScreenName[i].equalsIgnoreCase("BulkRecharge")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Administration/BulkRechargeUploadIn.jsp" target="right"><font
						size="1.5">Bulk Recharge Upload Report</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i].equalsIgnoreCase("BulkRecharge")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Administration/BulkRechargeUpload.jsp" target="right"><font
						size="1.5">Bulk Recharge Upload</font>
				</a>
				</span><BR />
				<%
					}

							}
				%>



			</div>
		</div>

		<%
			}
			}
		%>




		<!--------End Menu------------>

		<!--------Start Menu---------->
		<%
			int intRM1 = 0;
			int intRM2 = 0;
			int intRM3 = 0;
			int intRM4 = 0;
			int intRM5 = 0;
			int intRM6 = 0;
			int intRM7 = 0;
			int intRM8 = 0;
			int intRM12 = 0;
			int intRM14 = 0;
			int intRM15 = 0;
			int intRM16 = 0;
			int intRM17 = 0;
			int intRM18 = 0;
			int intRM19 = 0;
			int intRM20 = 0;
			int intRM22 = 0;
			int intRM23 = 0;
			int intRM24 = 0;
			int intRM30 = 0;
			int intRM47 = 0;
			int intRM112 = 0;
			int intRM33 = 0;
			int intRM32 = 0;
			int intRM34 = 0;
			int intRM45 = 0;
			int intRM61 = 0;
			int intRM52 = 0;
			int intRM31 = 0;
int intRMVNR=0;
                     int intRM46 = 0;
			int RMVAS = 0;

			if (Slist != null && !Slist.equalsIgnoreCase("")) {
				for (int i = 0; i < strScreenId.length; i++) {
					if (strScreenId[i].equalsIgnoreCase("RM1")
							|| strScreenId[i].equalsIgnoreCase("RM2")
							|| strScreenId[i].equalsIgnoreCase("RM47")
							|| strScreenId[i].equalsIgnoreCase("RM4")
							|| strScreenId[i].equalsIgnoreCase("RM5")
							|| strScreenId[i].equalsIgnoreCase("RM6")
							|| strScreenId[i].equalsIgnoreCase("RM7")
							|| strScreenId[i].equalsIgnoreCase("RM8")
							|| strScreenId[i].equalsIgnoreCase("RM12")
							|| strScreenId[i].equalsIgnoreCase("RM14")
							|| strScreenId[i].equalsIgnoreCase("RM15")
							|| strScreenId[i].equalsIgnoreCase("RM16")
							|| strScreenId[i].equalsIgnoreCase("RM17")
							|| strScreenId[i].equalsIgnoreCase("RM18")
							|| strScreenId[i].equalsIgnoreCase("RM19")
							|| strScreenId[i].equalsIgnoreCase("RM20")
							|| strScreenId[i].equalsIgnoreCase("RM22")
							|| strScreenId[i].equalsIgnoreCase("RM23")
							|| strScreenId[i].equalsIgnoreCase("RM24")
							|| strScreenId[i].equalsIgnoreCase("RM30")
							|| strScreenId[i].equalsIgnoreCase("RM112")
							|| strScreenId[i].equalsIgnoreCase("RM32")
							|| strScreenId[i].equalsIgnoreCase("RM33")
							|| strScreenId[i].equalsIgnoreCase("RM34")
							|| strScreenId[i].equalsIgnoreCase("RM45")
							|| strScreenId[i].equalsIgnoreCase("RM61")
							|| strScreenId[i].equalsIgnoreCase("RM52")
							|| strScreenId[i].equalsIgnoreCase("RM31")
							|| strScreenId[i].equalsIgnoreCase("RMVNR")
                                                 	|| strScreenId[i].equalsIgnoreCase("RM46")
							|| strScreenId[i].equalsIgnoreCase("RMVAS")) {
						if (strScreenId[i].equalsIgnoreCase("RM1")) {
							intRM1 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM2")) {
							intRM2 = 1;
						}
						/* if(strScreenId[i].equalsIgnoreCase("RM3")){
						   intRM3 = 1;
						 }*/
						if (strScreenId[i].equalsIgnoreCase("RM4")) {
							intRM4 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM5")) {
							intRM5 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM6")) {
							intRM6 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM7")) {
							intRM7 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM8")) {
							intRM8 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("ADM6")) {
							intADM4 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM12")) {
							intRM12 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM14")) {
							intRM14 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM15")) {
							intRM15 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM16")) {
							intRM16 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM17")) {
							intRM17 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM18")) {
							intRM18 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM19")) {
							intRM19 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM20")) {
							intRM20 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM22")) {
							intRM22 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM23")) {
							intRM23 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM24")) {
							intRM24 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM30")) {
							intRM30 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM112")) {
							intRM112 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM47")) {
							intRM47 = 1;
						}

						if (strScreenId[i].equalsIgnoreCase("RM33")) {
							intRM33 = 1;
						}

						if (strScreenId[i].equalsIgnoreCase("RM32")) {
							intRM32 = 1;
						}

						if (strScreenId[i].equalsIgnoreCase("RM34")) {
							intRM34 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM45")) {
							intRM45 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM61")) {
							intRM61 = 1;
						}

						if (strScreenId[i].equalsIgnoreCase("RM52")) {
							intRM52 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RM31")) {
							intRM31 = 1;
						}
						if (strScreenId[i].equalsIgnoreCase("RMVNR")) {
							intRMVNR = 1;
						}
                                         	if(strScreenId[i].equalsIgnoreCase("RM46")){       	 			
                                         		intRM46 = 1;
                                       		} 
						if(strScreenId[i].equalsIgnoreCase("RMVAS")){       	 			
                                         		RMVAS = 1;
                                       		} 
					}
				}
				if (intRM1 == 1 || intRM2 == 1 || intRM4 == 1 || intRM5 == 1
						|| intRM6 == 1 || intRM7 == 1 || intRM8 == 1
						|| intRM12 == 1 || intRM14 == 1 || intRM15 == 1
						|| intRM16 == 1 || intRM17 == 1 || intRM18 == 1
						|| intRM19 == 1 || intRM20 == 1 || intRM22 == 1
						|| intRM23 == 1 || intRM24 == 1 || intRM30 == 1
						|| intRM112 == 1 || intRM32 == 1 || intRM33 == 1
						|| intRM47 == 1 || intRM34 == 1 || intRM45 == 1
						|| intRM61 == 1 || intRM52 == 1 || intRM31 == 1 
						|| intRM46==1 	|| RMVAS==1) {
		%>
		<div class="technology">Reports</div>
		<div class="thelanguage">
			<div id="contentDiv">



				<%
					for (int i = 0; i < strScreenName.length; i++) {
								if (strScreenName[i].trim().equalsIgnoreCase(
										"SalesReconciliation")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/SalesReconciliation.jsp" target="right"><font
						size="1.5">Sales Reconciliation</font>
				</a>
				</span> <br />

				<%
					}

								if (strScreenName[i].equalsIgnoreCase("Sales Report")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/SalesReport1.jsp" target="_blank"><font
						size="1.5">Sales</font>
				</a>
				</span><BR />
				<!-- Added by abdul on 20-12-2017-->
				<%
					}

								if (strScreenName[i].equalsIgnoreCase("CVAS Report")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/CVAS_Report.jsp" target="right"><font
						size="1.5">CVAS Report</font>
				</a>
				</span><BR />
				<!-- end -->
				<%
					}

								if (strScreenName[i]
										.equalsIgnoreCase("EPINSales Report")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/SalesReportEPIN.jsp" target="_blank"><font
						size="1.5">Circle Destinationwise Sales Report</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Sales Report CDMA")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/SalesReportCDMA.jsp" target="_blank"><font
						size="1.5">CDMA Sales Report</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Cancelled Transaction Report")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/CancelledTransReport.jsp" target="right"><font
						size="1.5">Cancelled Transaction</font>
				</a>
				</span>
				<%
					}
								//if(strScreenName[i].equalsIgnoreCase("Pending Transaction Report")){
				%>
				<!--span class="subItem" classOut="subItem" classOver="subItemOver"><a href="Reports/PendingTransReport.jsp"  target="right" ><font size="1.5">Pending Transaction</font></a></span><BR /-->
				<%
					//}
								if (strScreenName[i]
										.equalsIgnoreCase("Pps Transaction Details Report")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/PrepaidTransactionDetailReport.jsp" target="right"><font
						size="1.5">PPS Transaction</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Stock Management Report")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/StockManagementReport2.jsp" target="_blanke"><font
						size="1.5">Stock Management</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("reconciliationReport")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/reconciliationReport.jsp" target="right"><font
						size="1.5">Reconciliation Report</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Channel TopUp Revenue Summary")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/MvoucherSummaryReport.jsp" target="right"><font
						size="1.5">Channel TopUp Revenue Summary</font>
				</a>
				</span><BR />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Pps Transaction Summary Report")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/PpsTransSummaryReport.jsp" target="right"><font
						size="1.5">PPS Transaction Summary</font>
				</a>
				</span><BR />
				<%
					}

								if (strScreenName[i]
										.equalsIgnoreCase("CBP Sales Report")) {
				%>
				<br>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/CBPSalesReport.jsp" target="right"><font
						size="1.5">CBP Sales Report</font>
				</a>
				</span> <br />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("CBP Commission Details")) {
				%>
				<br>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/CBPCommissionDetails.jsp" target="right"><font
						size="1.5">CBP Commission Details Report</font>
				</a>
				</span><br />
				<%
					}

								if (strScreenName[i].equalsIgnoreCase("Roaming Report")) {
				%>

				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/RoamingReport.jsp" target="right"><font
						size="1.5">Zone Reconciliation Transaction Report</font>
				</a>
				</span><br />
				<%
					}
								if (strScreenName[i].equalsIgnoreCase("IN Report")) {
				%>

				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/INReport.jsp" target="right"><font size="1.5">IN
						Wise Details Report</font>
				</a>
				</span><br />
				<%
					}
if(strScreenName[i].equalsIgnoreCase("VanityNumberSalesReport")){%>
         <br><span class="subItem" classOut="subItem" classOver="subItemOver"><a href="Reports/VanityNumberSalesReport.jsp"   target="right"><font size="1.5">Vanity Number Sales Report</font></a></span>

        <%
    }
								if (strScreenName[i]
										.equalsIgnoreCase("IN Circle Details")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/INReportCircle.jsp" target="right"><font
						size="1.5">Circle Wise IN Details Report</font>
				</a>
				</span><br />

				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Payments Report")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/Report1.jsp" target="_blanke"><font size="1.5">CTopUp
						Payments Received Report</font>
				</a>
				</span><br />

				<%
					}

								if (strScreenName[i]
										.equalsIgnoreCase("Wrong Moved Stock Cancellation Report")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/CanceledMovedStkReport.jsp" target="right"><font
						size="1.5">Wrong Moved Stock Cancellation Report</font>
				</a>
				</span><br />

				<%
					}

								if (strScreenName[i]
										.equalsIgnoreCase("Stock Allocation Approval Cancellation")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/StkAlockAppvCanRep.jsp" target="_blanke"><font
						size="1.5">Stock Cancellation Report</font>
				</a>
				</span><br />

				<%
					}

								if (strScreenName[i]
										.equalsIgnoreCase("Reverse Recharge Top up Report")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/ReverseRchTop3.jsp" target="right"><font
						size="1.5">Reverse Recharge Top up Report</font>
				</a>
				</span><br />

				<%
					}

								if (strScreenName[i]
										.equalsIgnoreCase("CircleINDenominationwisesales")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/CircleINDenomReport.jsp" target="right"><font
						size="1.5">INwise Circlewise Denominationwise sales Report</font>
				</a>
				</span><br />

				<%
					}

								if (strScreenName[i]
										.equalsIgnoreCase("BonusDiscountReport")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/bonusDiscountReport.jsp" target="right"><font
						size="1.5">Bonus Discount Report</font>
				</a>
				</span><br />

				<%
					}

								if (strScreenName[i].equalsIgnoreCase("InvoiceReport")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/invoiceReport.jsp" target="right"><font
						size="1.5">Invoice Reports</font>
				</a>
				</span>

				<%
					}

								if (strScreenName[i]
										.equalsIgnoreCase("simActivationsReport")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/simActivationsReport.jsp" target="right"><font
						size="1.5">SIM Activations Report</font>
				</a>
				</span><br />

				<%
					}

								if (strScreenName[i]
										.equalsIgnoreCase("reconciliationDetailReport")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/reconciliationDetailReport.jsp" target="right"><font
						size="1.5">ReconciliationDetail Report</font>
				</a>
				</span><br />

				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("starterPackCommissionReport")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/starterPackCommissionReport.jsp" target="right"><font
						size="1.5">StarterPackCommission Report</font>
				</a>
				</span><br />

				<%
					}
								//if (strScreenName[i].equalsIgnoreCase("CustomerCareForME2UReport")) {
				%>
				<!-- <span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/CustomerCareForME2UReport.jsp" target="right"><font
						size="1.5">Customer Care For ME2U Report</font> 
				</a>
				</span><br />-->
				<%
					//}
								//if (strScreenName[i].equalsIgnoreCase("Me2UBarUnBarReport")) {
				%>
				<!-- <span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/Me2UBarUnBarReport.jsp" target="right"><font
						size="1.5">ME2U Bar UnBar Report</font>
				</a>
				</span><br /> -->
				<%
					//}
								if (strScreenName[i]
										.equalsIgnoreCase("CompareCtopupIncdr")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/CompareCtopupIncdr.jsp" target="right"><font
						size="1.5">Compare Ctopup Incdr</font>
				</a>
				</span><br />

				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("FranchiseAddBalanceReport")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/FranchiseAddBalanceReport.jsp" target="right"><font
						size="1.5">Franchise Add Balance Report</font>
				</a>
				</span><br />

				<%
					}
                                                       if(strScreenName[i].equalsIgnoreCase("MNPCommissionReports")){
                            %>
                               <span class="subItem" classOut="subItem" classOver="subItemOver"><a 
                                      href="Reports/MNPCommissionReports.jsp"   target="right"><font size="1.5">MNP Commission Report</font>
                              </a>
                             </span><br/>

                            <%
                                  }
								if (strScreenName[i]
										.equalsIgnoreCase("UnifiedSimUsageReport")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/UnifiedSimUsageReport.jsp" target="right"><font
						size="1.5">Unified Sim Usage Report</font>
				</a>
				</span><br />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("Dealer Commission Report")) {
				%>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/DealerCommissionReport.jsp" target="right"><font
						size="1.5">Dealer Commission Report</font>
				</a>
				</span><br />
				<%
					}

								if (strScreenName[i]
										.equalsIgnoreCase("RetailerBonanzaReport")) {
				%>
				<br>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/RetailerBonanzaReport.jsp" target="right"><font
						size="1.5">Retailer Bonanza Report&nbsp;&nbsp;&nbsp;</font>
				</a>
				</span> <br />
				<%
					}

								if (strScreenName[i]
										.equalsIgnoreCase("BulkRechargeReport")) {
				%>
				<br>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/BulkRechargeReport.jsp" target="right"><font
						size="1.5">Bulk Recharge Report&nbsp;&nbsp;&nbsp;</font>
				</a>
				</span> <br />
				<%
					}

								if (strScreenName[i]
										.equalsIgnoreCase("VasRetailerReport")) {
				%>
				<br>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/VasRetailerReport.jsp" target="right"><font
						size="1.5">Vas Retailing Report&nbsp;&nbsp;&nbsp;</font>
				</a>
				</span> <br />
				<%
					}
								if (strScreenName[i]
										.equalsIgnoreCase("DetailedtransactionsReport")) {
				%>
				<br>
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="Reports/DetailedtransactionsReport.jsp" target="right"><font
						size="1.5">DetailedtransactionsReport&nbsp;&nbsp;&nbsp;</font>
				</a>
				</span> <br />
				<%
					}
								if (strScreenName[i].equalsIgnoreCase("FRCReport")) {
				%>
				<br><span class="subItem" classOut="subItem"
					classOver="subItemOver"><a href="Reports/FRCReport.jsp"
						target="right"><font size="1.5">FRC
							Report&nbsp;&nbsp;&nbsp;</font>
					</a>
				</span> <br /> <%
 	}

 			}
 %>



			</div>
		</div>

		<%
			}
			}
		%>

		<!--------Start Menu---------->
		<div class="technology">Change Password</div>
		<div class="thelanguage">
			<div id="contentDiv">
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="ChPassword.jsp" target="_parent"><font size="2">Change
						Password</font>
				</a>
				</span>
			</div>
		</div>


		<!--------End Menu------------>

		<!--------Start Menu---------->
		<div class="technology">Logout</div>
		<div class="thelanguage">
			<div id="contentDiv">
				<span class="subItem" classOut="subItem" classOver="subItemOver"><a
					href="MVoucherLogout.jsp" target="_parent"><font size="2">Logout</font>
				</a>
				</span>

			</div>
		</div>
</div>

</BODY>
</HTML>
