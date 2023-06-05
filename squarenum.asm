square:
        addiu   $sp,$sp,-8
       	sw      $fp,4($sp)
       	move   	$fp,$sp
       	sw      $4,8($fp)
       	lw      $3,8($fp)
       	lw      $2,8($fp)
       	nop
       	mult    $3,$2
       	mflo    $2
       	move    $sp,$fp
       	lw      $fp,4($sp)
       	addiu   $sp,$sp,8
       	jr      $ra
       	nop
		
		
