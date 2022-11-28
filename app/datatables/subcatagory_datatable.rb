class SubcatagoryDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Subcatagory.id", cond: :eq, orderable: true, searchable: false },
      name: { source: "Subcatagory.name", cond: :like,searchable: true, orderable: false }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        name: record.name
      }
    end
  end

  def get_raw_records
    Subcatagory.all
  end

end
