module DriversHelper
    def cache_key_for_driver(dri)
        "driver/#{dri.id}/#{dri.updated_at}"
    end

    def cache_key_for_driver_table
        "driver-table-#{Driver.maximum(:updated_at)}-#{User.maximum(:updated_at)}"
    end
end
