module Katapaty::Resources
  class Balance < Katapaty::Resource
    attr_accessor :address,
                  :asset,
                  :quantity
  end

  class Send < Katapaty::Resource
    attr_accessor :tx_index,
                  :tx_hash,
                  :block_index,
                  :source,
                  :destination,
                  :asset,
                  :quantity,
                  :validity
  end

  class Broadcast < Katapaty::Resource
    # Value: Open Broadcast
    OPEN_BROADCAST = -1.0

    # (integer): The transaction index
    attr_accessor :tx_index

    # (string): The transaction hash
    attr_accessor :tx_hash

    # (integer): The block index (block number in the block chain)
    attr_accessor :block_index

    # (string): The address that made the broadcast
    attr_accessor :source

    # (string): The time the broadcast was made, in Unix time.
    attr_accessor :timestamp

    # (float): The numerical value of the broadcast
    attr_accessor :value

    # (float): How much of every bet on this feed should go to its operator;
    # a fraction of 1, (i.e. .05 is five percent)
    attr_accessor :fee_multiplier

    # (string): The textual component of the broadcast
    attr_accessor :text

    # (string): Set to "valid" if a valid broadcast. Any other setting signifies
    # an invalid/improper broadcast
    attr_accessor :validity

    # (float): How much of every bet on this feed should go to its
    # operator; a fraction of 1, (i.e. .05 is five percent). Used on create.
    attr_accessor :fee_fraction
  end

  # An object that describes an instance of a specific burn.
  class Burn < Katapaty::Resource
    # (integer): The transaction index
    attr_accessor :tx_index

    # (string): The transaction hash
    attr_accessor :tx_hash

    # (integer): The block index (block number in the block chain)
    attr_accessor :block_index

    # (string): The address the burn was performed from
    attr_accessor :source

    # (integer): The quantity of BTC burned
    attr_accessor :burned

    # (integer): The quantity of XPC actually earned from the burn (takes into
    # account any bonus quantitys, 1 BTC limitation, etc)
    attr_accessor :earned

    # (string): Set to "valid" if a valid burn. Any other setting signifies an
    # invalid/improper burn
    attr_accessor :validity

    # (string): Set to "valid" if a valid burn. Any other setting signifies an
    # invalid/improper burn
    attr_accessor :status

    # (integer): The amount of BTC to burn (only used in the Create Burn)
    attr_accessor :quantity
  end

  # An object that describes a specific asset callback (i.e. the exercising of
  # a call option on an asset owned by the source address).
  class Callback < Katapaty::Resource
    # (integer): The transaction index
    attr_accessor :tx_index

    # (string): The transaction hash
    attr_accessor :tx_hash

    # block_index (integer): The block index (block number in the block chain)
    attr_accessor :block_index

    # (string): The source address of the call back (should be the current owner
    # of the asset)
    attr_accessor :source

    # (integer): A floating point number greater than zero but less than or
    # equal to 1, where 0% is for a callback of 0%
    attr_accessor :fraction

    # of the balance of each of the asset's holders, and 1 would be for a
    # callback of 100%). For example, 0.56 would be 56%. Each holder of the
    # called asset will be paid the call price for the asset, times the number
    # of units of that asset that were called back from them.
    attr_accessor :of

    # (string): The asset being called back
    attr_accessor :asset

    # (string): Set to "valid" if a valid send. Any other setting signifies an
    # invalid/improper send
    attr_accessor :validity
  end

  # An object that describes a cancellation of a (previously) open order or bet.
  class Cancel < Katapaty::Resource
    # (integer): The transaction index
    attr_accessor :tx_index

    # (string): The transaction hash
    attr_accessor :tx_hash

    # (integer): The block index (block number in the block chain)
    attr_accessor :block_index

    # (string): The address with the open order or bet that was cancelled
    attr_accessor :source

    # (string): The transaction hash of the order or bet cancelled
    attr_accessor :offer_hash

    # (string): Set to "valid" if a valid burn. Any other setting signifies an
    # invalid/improper burn
    attr_accessor :validity
  end

  # An object that describes a account credit.
  class Credit < Katapaty::Resource
    # (integer): The transaction index
    attr_accessor :tx_index

    # (string): The transaction hash
    attr_accessor :tx_hash

    # (integer): The block index (block number in the block chain)
    attr_accessor :block_index

    # (string): The address debited or credited
    attr_accessor :address

    # (string): The asset debited or credited
    attr_accessor :asset

    # (integer): The quantity of the specified asset debited or credited
    attr_accessor :quantity

    attr_accessor :action

    attr_accessor :event
  end

  # An object that describes a account debit or credit.
  class Debit < Katapaty::Resource
    # (integer): The transaction index
    attr_accessor :tx_index

    # (string): The transaction hash
    attr_accessor :tx_hash

    # (integer): The block index (block number in the block chain)
    attr_accessor :block_index

    # (string): The address debited or credited
    attr_accessor :address

    # (string): The asset debited or credited
    attr_accessor :asset

    # (integer): The quantity of the specified asset debited or credited
    attr_accessor :quantity

    attr_accessor :action

    attr_accessor :event
  end

  # An object that describes an issuance of dividends on a specific user
  # defined asset.
  class Dividend < Katapaty::Resource
    # (integer): The transaction index
    attr_accessor :tx_index

    # (string): The transaction hash
    attr_accessor :tx_hash

    # (integer): The block index (block number in the block chain)
    attr_accessor :block_index

    # (string): The address that issued the dividend
    attr_accessor :source

    # (string): The asset that the dividends are being rewarded on
    attr_accessor :asset

    # (integer): The quantity of XCP rewarded per whole unit of the asset
    attr_accessor :quantity_per_unit

    # (string): Set to "valid" if a valid burn. Any other setting signifies an
    # invalid/improper burn
    attr_accessor :validity

    # (string, required): The asset that the dividends are paid in.
    attr_accessor :dividend_asset
  end

  # An object that describes a specific occurance of a user defined asset being
  # issued, or re-issued
  class Issuance < Katapaty::Resource
    # (integer): The transaction index
    attr_accessor :tx_index

    # (string): The transaction hash
    attr_accessor :tx_hash

    # (integer): The block index (block number in the block chain)
    attr_accessor :block_index

    # (string): The asset being issued, or re-issued
    attr_accessor :asset

    # (integer): The quantity of the specified asset being issued
    attr_accessor :quantity

    # (boolean): Whether or not the asset is divisible (must agree with previous
    # issuances of the asset, if there are any)
    attr_accessor :divisible

    # issuer (string):
    attr_accessor :issuer

    # (boolean): Whether or not this objects marks the transfer of ownership
    # rights for the specified quantity of this asset
    attr_accessor :transfer

    # (string): Set to "valid" if a valid issuance. Any other setting signifies
    # an invalid/improper issuance
    attr_accessor :validity

    # (string): This is used when creating an issuance, and indicates the source
    # address of the asset
    attr_accessor :source

    # (string): This is used when creating an issuance, and indicates
    # the destination address of the asset
    attr_accessor :description

    # (string): This is used when creating an issuance transfer, and indicates
    # the destination address of the asset
    attr_accessor :transfer_destination
  end

  # An object that describes a specific order.
  class Order < Katapaty::Resource
    # (integer): The transaction index
    attr_accessor :tx_index

    # (string): The transaction hash
    attr_accessor :tx_hash

    # (integer): The block index (block number in the block chain)
    attr_accessor :block_index

    # (string): The address that made the order
    attr_accessor :source

    # (string): The asset being offered
    attr_accessor :give_asset

    # (integer): The quantity of the specified asset being offered
    attr_accessor :give_quantity

    # (integer): The quantity of the specified give asset remaining for the order
    attr_accessor :give_remaining

    # (string): The asset desired in exchange
    attr_accessor :get_asset

    # (integer): The quantity of the specified asset desired in exchange
    attr_accessor :get_quantity

    # (integer): The quantity of the specified get asset remaining for the order
    attr_accessor :get_remaining

    # (float): The given exchange rate (as an exchange ratio desired from the
    # asset offered to the asset desired)
    attr_accessor :price

    # (integer): The number of blocks over which the order should be valid
    attr_accessor :expiration

    # (integer): The miners' fee provided; in BTC; required only if selling BTC
    # (should not be lower than is required for acceptance in a block)
    attr_accessor :fee_provided

    # (integer): The miners' fee required to be paid by orders for them to match
    # this one; in BTC; required only if buying BTC (may be zero, though)
    attr_accessor :fee_required
  end

  # An object that describes a specific occurance of two orders being matched
  # (either partially, or fully)
  class OrderMatch < Katapaty::Resource
    # (integer): The Bitcoin transaction index of the first (earlier) order
    attr_accessor :tx0_index

    # (string): The Bitcoin transaction hash of the first order
    attr_accessor :tx0_hash

    # (integer): The Bitcoin block index of the first order
    attr_accessor :tx0_block_index

    # (integer): The number of blocks over which the first order was valid
    attr_accessor :tx0_expiration

    # (string): The address that issued the first (earlier) order
    attr_accessor :tx0_address

    # (integer): The transaction index of the second (matching) order
    attr_accessor :tx1_index

    # (string): The transaction hash of the second order
    attr_accessor :tx1_hash

    # (integer): The block index of the second order
    attr_accessor :tx1_block_index

    # (string): The address that issued the second order
    attr_accessor :tx1_address

    # (integer): The number of blocks over which the second order was valid
    attr_accessor :tx1_expiration

    # (string): The asset exchanged FROM the first order to the second order
    attr_accessor :forward_asset

    # (integer): The quantity of the specified forward asset
    attr_accessor :forward_quantity

    # (string): The asset exchanged FROM the second order to the first order
    attr_accessor :backward_asset

    # (integer): The quantity of the specified backward asset
    attr_accessor :backward_quantity

    # (string): Set to "valid" if a valid order match. Any other setting
    # signifies an invalid/improper order match
    attr_accessor :validity
  end

  # An object that describes a specific event in the counterpartyd message feed
  # (which can be used by 3rd party applications to track state changes to the
  # counterpartyd database on a block-by-block basis).
  class Message < Katapaty::Resource
    # (integer): The message index (i.e. transaction index)
    attr_accessor :message_index

    # (integer): The block index (block number in the block chain) this event
    # occurred on
    attr_accessor :block_index

    # (string): A string denoting the entity that the message relates to, e.g.
    # "credits", "burns", "debits". The category matches the relevant table name
    # in counterpartyd (see blocks.py for more info).
    attr_accessor :category

    # (string): The operation done to the table noted in category. This is
    # either "insert", or "update".
    attr_accessor :command

    # (string): A JSON-encoded object containing the message data. The
    # properties in this object match the columns in the table referred to by category.
    attr_accessor :bindings
  end

  # An object that describes a specific asset callback (i.e. the exercising of
  # a call option on an asset owned by the source address).
  class Callback < Katapaty::Resource
    # (integer): The transaction index
    attr_accessor :tx_index

    # (string): The transaction hash
    attr_accessor :tx_hash

    # (integer): The block index (block number in the block chain)
    attr_accessor :block_index

    # (string): The source address of the call back (should be the current owner
    # of the asset)
    attr_accessor :source

    # (integer): A floating point number greater than zero but less than
    # or equal to 1, where 0% is for a callback of 0% of the balance of each of
    # the asset's holders, and 1 would be for a callback of 100%). For example,
    # 0.56 would be 56%. Each holder of the called asset will be paid the call
    # price for the asset, times the number of units of that asset that were
    # called back from them.
    attr_accessor :fraction

    # asset (string): The asset being called back
    attr_accessor :asset

    # (string): Set to "valid" if a valid send. Any other setting signifies an
    # invalid/improper send
    attr_accessor :validity
  end

  # An object that describes the expiration of a bet created by the source
  # address.
  class BetExpiration < Katapaty::Resource
    # (integer): The transaction index of the bet expiring
    attr_accessor :bet_index

    # bet_hash (string): The transaction hash of the bet expiriing
    attr_accessor :bet_hash

    # (integer): The block index (block number in the block chain) when this
    # expiration occurred
    attr_accessor :block_index

    # (string): The source address that created the bet
    attr_accessor :source
  end

  # An object that describes the expiration of an order created by the source
  # address.
  class OrderExpiration < Katapaty::Resource
    # (integer): The transaction index of the order expiring
    attr_accessor :order_index

    # (string): The transaction hash of the order expiriing
    attr_accessor :order_hash

    # (integer): The block index (block number in the block chain) when this
    # expiration occurred
    attr_accessor :block_index

    # (string): The source address that created the order
    attr_accessor :source
  end

  # An object that describes the expiration of a bet match.
  class BetMatchExpiration < Katapaty::Resource
    # (integer): The transaction index of the bet match ID (e.g. the
    # concatenation of the tx0 and tx1 hashes)
    attr_accessor :bet_match_id

    # (string): The tx0 (first) address for the bet match
    attr_accessor :tx0_address

    # (string): The tx1 (second) address for the bet match
    attr_accessor :tx1_address

    # (integer): The block index (block number in the block chain) when this
    # expiration occurred
    attr_accessor :block_index
  end

  # An object that describes the expiration of an order match.
  class OrderMatchExpiration < Katapaty::Resource
    # (integer): The transaction index of the order match ID (e.g. the
    # concatenation of the tx0 and tx1 hashes)
    attr_accessor :order_match_id

    # (string): The tx0 (first) address for the order match
    attr_accessor :tx0_address

    # (string): The tx1 (second) address for the order match
    attr_accessor :tx1_address

    # (integer): The block index (block number in the block chain) when this
    # expiration occurred
    attr_accessor :block_index
  end

  # An object that publishes a compiled serpent contract onto the Counterparty
  # network
  class Publish < Katapaty::Resource
    # (string) the source address
    attr_accessor :source

    # (integer) the price of gas
    attr_accessor :gasprice

    # (integer) the maximum quantity of {} to be used to pay for the execution (satoshis)
    attr_accessor :startgas

    # (integer) quantity of {} to be transfered to the contract (satoshis)
    attr_accessor :endowment

    # (string) the hex‐encoded contract (returned by 'serpent compile')
    attr_accessor :code_hex
  end

  # An object that executes contract code in the blockchain
  class Execute < Katapaty::Resource
    # (string) the source address
    attr_accessor :source

    # (integer) the price of gas
    attr_accessor :gasprice

    # (integer) the maximum quantity of {} to be used to pay for the execution (satoshis
    attr_accessor :startgas

    # (integer) the contract ID of the contract to be executed
    attr_accessor :contract_id

    # (integer) quantity to be transfered to the contract (satoshis)
    attr_accessor :value

    # (string) data to be provided to the contract (returned by serpent encode_datalist)
    attr_accessor :payload_hex
  end
end
