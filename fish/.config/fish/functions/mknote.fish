function mknote -d "Create a note file of the format ZYYYYMMDDHHmm_args.md"
	set note_path (pwd)
	if test -z $NOTES_DIR
		echo '$NOTES_DIR not set, creating note in pwd'
	else
		set note_path $NOTES_DIR
	end

	set new_note $note_path/(echo 'Z'(date '+%Y%m%d%H%M')_(echo "$argv" | tr '[:upper:]' '[:lower:]' | tr ' ' '_').md)

	touch $new_note
	echo "Created $new_note"
end
