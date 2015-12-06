module HitchersHelper
    def cache_key_for_hitcher(hit)
        "hitcher/#{hit.id}/#{hit.updated_at}"
    end
    def cache_key_for_hitcher_table
        "hitcher-table-#{Hitcher.maximum(:updated_at)}-#{User.maximum(:updated_at)}"
    end
end
