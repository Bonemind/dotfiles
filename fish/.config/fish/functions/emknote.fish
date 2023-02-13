function emknote -d "Create and edit a new note. Note name is converted to ZYYYYMMDDHHmm_argv.md"
	set note_path (pwd)
	if test -z $NOTES_DIR
		echo '$NOTES_DIR not set, creating note in pwd'
	else
		set note_path $NOTES_DIR
	end

	set new_note $note_path/(echo 'Z'(date '+%Y%m%d%H%M')_(echo "$argv" | tr '[:upper:]' '[:lower:]' | tr ' ' '_').md)

	touch $new_note
	nvim $new_note
end
