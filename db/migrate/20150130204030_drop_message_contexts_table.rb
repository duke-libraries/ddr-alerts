class DropMessageContextsTable < ActiveRecord::Migration

  def up
    if table_exists?("ddr_alerts_message_contexts")
      drop_table "ddr_alerts_message_contexts"
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
