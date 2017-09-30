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
const EPOCH2116 = Date("2116-01-01")
const EPOCH2200 = Date("2200-01-01")
const EPOCH2261 = Date("2261-01-01")

if NANOTIME_FRAME == 0 # UMT
  # with the signbit free
  const RATAFIRST = date2rata(EPOCH1970)
  const RATAFINAL = date2rata(EPOCH2261)
elseif NANOTIME_FRAME == 1 # LMT
  # with the signbit free
  const RATAFIRST = date2rata(EPOCH1970)
  const RATAFINAL = date2rata(EPOCH2261)
elseif NANOTIME_FRAME == 2 # UMT and LMT
  # with the sign and the oveflow bits free
  const RATAFIRST = date2rata(EPOCH1970)
  const RATAFINAL = date2rata(EPOCH2101)
  # signbit(LMT.value) == true , value <  0
  # signbit(UMT.value) == false, value >= 0
end

@inline function rataguard(rata::Int64)
    (RATAFIRST <= rata <= RATAFINAL) && return nothing
    throw(ErrorException("date must be in $(EPOCH1950)..$(EPOCH2200)."))
end
