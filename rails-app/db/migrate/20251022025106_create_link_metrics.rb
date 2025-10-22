class CreateLinkMetrics < ActiveRecord::Migration[8.0]
    def change
        create_table :link_metrics do |t|
            t.belongs_to :link, foreign_key: true
            t.string :ip_address
            t.string :user_agent
            t.datetime :access_in
        end
    end
end
