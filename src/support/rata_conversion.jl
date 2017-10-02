
@inline function date2rata(caldate::Date)
    return date2epochdays(caldate) - 365
end

@inline function rata2date(rata::Int64)
    return epochdays2date(rata + 365)
end

# supported span of dates
const EPOCH1950 = Date("1950-01-01")
const EPOCH1970 = Date("1970-01-01")
const EPOCH2101 = Date("2101-01-01")
const EPOCH2112 = Date("2112-01-01")
const EPOCH2116 = Date("2116-01-01")
const EPOCH2200 = Date("2200-01-01")
const EPOCH2202 = Date("2202-01-01")
const EPOCH2261 = Date("2261-01-01")

if NANOTIME_FRAME == 0 # no marking
  # with the signbit free
  const EPOCHFIRST = EPOCH1970
  const EPOCHFINAL = EPOCH2261
elseif NANOTIME_FRAME == 1 # marked xor unmarked
  # with the signbit free
  const EPOCHFIRST = EPOCH1970
  const EPOCHFINAL = EPOCH2261
elseif NANOTIME_FRAME == 2 # tristate + unmarked
  # with the sign and the oveflow bits free
  const EPOCHFIRST = EPOCH1970
  const EPOCHFINAL = EPOCH2112 # EPOCH2116 is max
end

const RATAFIRST = date2rata(EPOCHFIRST)
const RATAFINAL = date2rata(EPOCHFINAL)

@inline function rataguard(rata::Int64)
    (RATAFIRST <= rata <= RATAFINAL) && return nothing
    throw(ErrorException("date must be in $(EPOCHFIRST)..$(EPOCHFINAL)."))
end
