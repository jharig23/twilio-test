class CreateTxtTests < ActiveRecord::Migration
  def change
    create_table :txt_tests do |t|

      t.timestamps
    end
  end
end
