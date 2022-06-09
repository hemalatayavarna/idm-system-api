%dw 2.0
import p from Mule

//Set Common True-False 
fun setTrueOrFalse(value)=
	if (isEmpty(value)) false 
	else
		if ( p('true.characters') contains (value) )
			true
		else
			false

//To set Gender 
fun setGender(gender)=
	if ( p('common.gender.in.male') contains (gender) )
		p('common.gender.out.male')
	else if ( p('common.gender.in.female') contains (gender) )
		p('common.gender.out.female')
	else
		p('common.gender.out.unspecified')


