class CreateDdrAlertsMessageContexts < ActiveRecord::Migration
  def up
    unless table_exists?("ddr_alerts_message_contexts")
      create_table "ddr_alerts_message_contexts" do |t|
        t.belongs_to "message", index: true
        t.string     "context"
        t.timestamps
      end
    end
  end

  def down
    # raise ActiveRecord::IrreversibleMigration
    drop_table "ddr_alerts_message_contexts"
  end
end