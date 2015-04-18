class CreateInvoiceDetails < ActiveRecord::Migration
  def up

    create_table :invoice_details do |t|
      t.integer   'invid'
      t.datetime  'invdate'
      t.float     'amount'
      t.float     'tax'
      t.float     'total'
      t.string    'note'
    end

    1.upto 100 do |i|
      amount = rand(10)
      tax = amount * 0.21
      InvoiceDetail.create(
        :invid => i,
        :invdate => Time.now + rand(10),
        :amount => amount,
        :tax => tax,
        :total => amount + tax,
        :note => '')
    end
  end
  def down
    drop_table :invoice_details
  end

end