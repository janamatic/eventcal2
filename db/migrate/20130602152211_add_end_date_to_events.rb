class AddEndDateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :end_date, :date
    add_column :events, :end_time, :string
    add_column :events, :recurring, :string
  end
end
