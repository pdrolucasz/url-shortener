class CreateLinks < ActiveRecord::Migration[8.0]
    def change
        create_table :links do |t|
            t.string :short_code, null: false, index: true
            t.string :short_url, null: false, index: true
            t.string :original_url, null: false, index: true
            t.integer :click_count, default: 0
            t.datetime :expires_at

            t.timestamps
        end
    end
end
