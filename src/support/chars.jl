const POSITIVE = '+'
const NEGATIVE = '−'
const PLUSMINUS = '±'
const MINUSPLUS = '∓'
const HMS_SEP  = ':'
const DYHR_SEP = 'd'
const SCSS_SEP = 's'
const YMD_SEP  = '-'
const YM_SEP   = 'y'
const YM_DHMS_SEP = 'm'
const YMD_HMS_SEP = 'T'

const DEC_SEP  = '.'
const DTM_SEP  = 'T'
const UT_SFX   = 'Ƶ'
const UTC_SFX  = 'Z'


const ZEROCHARS = ["", "0", "00", "000", "0000", "00000", "000000", "0000000", "00000000", "000000000"]

@inline posneg(isneg::Bool) = isneg ? NEGATIVE : POSITIVE

@inline function onedigit(x::Integer)
    string(x)[1:1]
end

@inline function twodigits(x::Integer)
    x < 10 ? string('0',x) : string(x)
end

@inline function threedigits(x::Integer)
    x < 10 ? string("00",x) : (x < 100 ? string('0', x) : string(x))
end

function sixdigits(x::Integer)
    hi, lo = divrem(x, 1000)
    string( threedigits(hi), threedigits(lo) )
end

function ninedigits(x::Integer)
   md, lo = divrem(x, 1000)
   hi, md = divrem(md, 1000)
   string( threedigits(hi), threedigits(mid), threedigits(lo) )
end

function signed_hoursmins(x::Integer)
   isneg, absx = signbit(x), abs(x)
   h, m = divrem(absx, 60)
   string(posneg(isneg), twodigits(h), HMS_SEP, twodigits(m))
end
