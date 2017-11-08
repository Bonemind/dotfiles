# Fetches a playlist for a certain artist and writes the playlist to <artist name>.m3u
function mpdpl
	set spacesreplaced $argv[1]
	set joined $argv[1]
	if begin; test (count $argv) -gt 1; end
		for val in $argv[2..-1]
			set spacesreplaced $spacesreplaced%20$val
			set joined $joined$val
		end
	end
	curl -s "http://localhost:9999/get_new_station_by_search?type=artist&artist="$spacesreplaced"&num_tracks=100" > $joined.m3u

end

