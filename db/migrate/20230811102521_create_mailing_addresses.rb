class CreateMailingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :mailing_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :street
      t.string :city
      t.string :state
      t.string :country
      t.integer :pincode

      t.timestamps
    end
  end
end
