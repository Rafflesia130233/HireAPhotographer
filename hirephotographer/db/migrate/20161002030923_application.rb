class Application < ActiveRecord::Migration[5.0]
  def change

    add_column :applications, :expectedsalary, :double
    add_column :applications, :availablefrom, :date
    add_column :applications, :coverletter, :string
  end
end
