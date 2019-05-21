errore = -1
i = 1
n = 0
pull n
fatt = 1
if n>170 | !n then do say errore fatt=errore end else do
	do i=1 to n+1
	fatt=fatt*i
	end
say fatt
end
