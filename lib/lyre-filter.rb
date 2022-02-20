require "word_wrap"
require "word_wrap/core_ext"

##
# this module provides text escape functions needed by the Lyre theme.
module LyreEscapeFilters
    module LyreJsonify
        # safe true
        ##
        # jsonify input for podlove's needs.
        def lyre_jsonify(input)
            ret = input.to_s
            
            ret = ret.gsub("\\", "\\\\") #  "\" => "\\" 
            ret = ret.gsub("\b", "\\b")
            ret = ret.gsub("\f", "\\f")
            ret = ret.gsub("\n", "\\n")
            ret = ret.gsub("\r", "\\r")
            ret = ret.gsub("\t", "\\t")
            ret = ret.gsub("\"", "\\\"")

            return ret
        end
    end

    module LyreTimeToYT
        def lyre_time_to_yt(input)
            ret = ""
            swp = input.to_i

            # hours
            remainder = swp % 3600 # hours
            hour      = (swp - remainder) / 3600
            swp       = swp - (hour * 3600)

            # minutes
            remainder = swp % 60 # minutes
            minute    = (swp - remainder) / 60
            swp       = swp - (minute * 60)

            # swp should be seconds
            second = swp

            # actually assemble into a padded string
            # stupidly convoluted compared to python IMHO
            ret = ret + format('%02d', hour) + ":"
            ret = ret + format('%02d', minute) + ":"
            ret = ret + format('%02d', second)

            # done
            return ret

        end
    end

    ##
    # wraps text for summary in credits files
    # so it's not just one massive kerblap of a text entry
    module LyreSummaryTextWrap
        def lyre_summary_text_wrap(input)
            ret = input.to_s
            return ret.wrap 80 # eg 80 columns
        end
    end
end

# register filters
Liquid::Template.register_filter(LyreEscapeFilters::LyreJsonify)
Liquid::Template.register_filter(LyreEscapeFilters::LyreTimeToYT)
Liquid::Template.register_filter(LyreEscapeFilters::LyreSummaryTextWrap)
