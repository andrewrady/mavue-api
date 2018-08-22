=begin
RestGateway Module: A library of functions used to call the Rest Gateway web service.
This class is required for all Ruby code making a call to Rest Gateway. Please refer to the gateway documentation web page for specifics on what parameters to use for each call.
version = 1.2.0
Last Revision: 6/23/2016
=end
require 'httparty'
# Due to issues with verifying server certificate, disable OpenSSL https verification for now
HTTParty::Basement.default_options.update(verify: false)
require 'json'

module RestGateway
class ServiceClient
	@@version = "1.2.0"
	attr_reader   :responsecode, :result
	attr_accessor :data

	def initialize(transactionData)
		@apiUrl = "https://secure.1stpaygateway.net/secure/RestGW/Gateway/Transaction/"
		@TestMode = false
		@data = transactionData
		@status = "None"
		@result = {}
		@responsecode = 0
	end

	def SwitchEnv
		# Switch between production and validation
		if @apiUrl == "https://secure.1stpaygateway.net/secure/RestGW/Gateway/Transaction/"
			@apiUrl = "https://secure-v.goemerchant.com/secure/RestGW/Gateway/Transaction/"
			@TestMode = true
		elsif @apiUrl == "https://secure-v.goemerchant.com/secure/RestGW/Gateway/Transaction/"
			@apiUrl = "https://secure.1stpaygateway.net/secure/RestGW/Gateway/Transaction/"
			@TestMode = false
		else
			@apiUrl = "https://secure.1stpaygateway.net/secure/RestGW/Gateway/Transaction/"
			@TestMode = false
		end
	end

	def performRequest(apiRequest, callBackSuccess, callBackFailure)
		@result.clear
		@responsecode = 0
		@status = "None"
		header = {'Content-Type' => 'application/json', 'charset' => 'utf-8'}
		wsresponse = HTTParty.post(apiRequest, body: @data.to_json, headers: header)
		@responsecode = wsresponse.code
		response = JSON.parse(wsresponse.body)
		if (response.has_key? "isError" and response["isError"]==true)
			@status = "Error"
			@result = response
			unless callBackFailure.nil?
				callBackFailure.call(@status, @result)
			end
		elsif (response.has_key? "validationHasFailed" and response["validationHasFailed"]==true)
			@status = "Validation"
			@result = response
			unless callBackFailure.nil?
				callBackFailure.call(@status, @result)
			end
		elsif (response.has_key? "isSuccess" and response["isSuccess"]==true)
			@status = "Success"
			@result = response
			unless callBackSuccess.nil?
				callBackSuccess.call(@result)
			end
		else
			@status = "Unknown"
			@result = response
			# No callback, status wasn't recognized
		end
	end

	def createAuth(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "Auth"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def createAuthUsing1stPayVault(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "AuthUsingVault"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def closeBatch(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "CloseBatch"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def createCredit(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "Credit"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def createCreditRetailOnly(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "CreditRetailOnly"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def createCreditRetailOnlyUsing1stPayVault(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "CreditRetailOnlyUsingVault"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def query(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "Query"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def createSale(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "Sale"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def createSaleUsing1stPayVault(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "SaleUsingVault"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def createReAuth(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "ReAuth"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def createReDebit(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "ReDebit"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def createReSale(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "ReSale"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def performSettle(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "Settle"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def applyTipAdjust(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "TipAdjust"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def performVoid(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "Void"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	#####################
	#### ACH Methods ####
	#####################

	def performAchVoid(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "AchVoid"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def createAchCredit(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "AchCredit"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def createAchDebit(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "AchDebit"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def createAchCreditUsing1stPayVault(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "AchCreditUsingVault"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def createAchDebitUsing1stPayVault(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "AchDebitUsingVault"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def getAchCategories(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "AchGetCategories"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def createAchCategories(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "AchCreateCategory"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def deleteAchCategories(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "AchDeleteCategory"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def setupAchStore(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "AchSetupStore"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	#######################
	#### Vault Methods ####
	#######################

	def createVaultContainer(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "VaultCreateContainer"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def createVaultAchRecord(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "VaultCreateAchRecord"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def createVaultCreditCardRecord(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "VaultCreateCCRecord"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def createVaultShippingRecord(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "VaultCreateShippingRecord"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def deleteVaultContainerAndAllAsscData(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "VaultDeleteContainerAndAllAsscData"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def deleteVaultAchRecord(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "VaultDeleteAchRecord"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def deleteVaultCreditCardRecord(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "VaultDeleteCCRecord"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def deleteVaultShippingRecord(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "VaultDeleteShippingRecord"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def updateVaultContainer(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "VaultUpdateContainer"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def updateVaultAchRecord(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "VaultUpdateAchRecord"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def updateVaultCreditCardRecord(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "VaultUpdateCCRecord"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def updateVaultShippingRecord(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "VaultUpdateShippingRecord"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def queryVaults(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "VaultQueryVault"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def queryVaultForCreditCardRecords(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "VaultQueryCCRecord"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def queryVaultForAchRecords(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "VaultQueryAchRecord"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def queryVaultForShippingRecords(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "VaultQueryShippingRecord"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	######################
	#### Misc Methods ####
	######################

	def modifyRecurring(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "RecurringModify"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def submitAcctUpdater(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "AccountUpdaterSubmit"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def submitAcctUpdaterVault(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "AccountUpdaterSubmitVault"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

	def getAcctUpdaterReturn(params={}, callBackSuccess=nil, callBackFailure=nil)
		request = @apiUrl + "AccountUpdaterReturn"
		@data = @data.merge(params)
		self.performRequest(request, callBackSuccess, callBackFailure)
	end

end
end