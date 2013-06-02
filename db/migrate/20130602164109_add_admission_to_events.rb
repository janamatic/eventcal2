class AddAdmissionToEvents < ActiveRecord::Migration
  def change
    add_column :events, :admission, :string
  end
end
