module WalletsHelper

  def balance address
    @web3.eth.getBalance address
  end

  def transaction_time trans
    tx = @web3.eth.getTransactionByHash trans
    block = @web3.eth.getBlockByNumber tx.blockNumber.to_i 16
    block.timestamp_time
  end

  def last_trans address
    trans = get_transactions address
    unless trans.empty?
    transaction_time trans.last
    else
      "No transactions"
      end
  end

  def transaction_id trans
    tx = @web3.eth.getTransactionByHash trans
    tx.transactionIndex.to_i 16
  end

  def transaction_amount trans
    tx = @web3.eth.getTransactionByHash trans
    1.0 * (tx.value.to_i 16) / 10**18
  end

  def status trans
  tx_receipt = @web3.eth.getTransactionReceipt trans
    if tx_receipt.success?
      "OK"
    else
      "FAILED"
    end
  end

  def init_web3
    @web3 = Web3::Eth::Rpc.new host: 'mainnet.infura.io/jFHXYbB7egxIbtmoOzzb',
                               port: 443,
                               connect_options: {
                                   open_timeout: 20,
                                   read_timeout: 140,
                                   use_ssl: true,
                                   rpc_path: 'jFHXYbB7egxIbtmoOzzb'
                               }
    @web3
  end

  def get_transactions wallet_adress

    api_key = "WQI2F6XCS7I9M44Z2UHGI6XJXAW8KXIQNU"

    address = wallet_adress
    wallet_trans = Array.new
    url = "http://api.etherscan.io/api?module=account&action=txlist&address=#{address}&startblock=0&endblock=99999999&sort=asc&apikey=#{api_key}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    res = JSON.parse(response)
    res["result"].each{|block|
      if block["to"].eql?address
        wallet_trans << block["hash"]
      end
    }
    wallet_trans
  end

end
