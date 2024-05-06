function Get_char(segments, r, c)
  if segments[2] and c == 5 and r <= 2 then
    return "█"
  end

  if segments[3] and c == 5 and r > 2 then
    return "█"
  end

  if segments[4] and c == 1 and r > 2 then
    return "█"
  end

  if segments[5] and c == 1 and r <= 2 then
    return "█"
  end

  if segments[1] and r == 1 then
    return "▀"
  end
  if segments[6] and r == 4 then
    return "▄"
  end
  if segments[7] and r == 2 then
    return "▄"
  end
  if segments[7] and r == 3 then
    return "▀"
  end
  return " "
end

function Get_display(segments)
  local display = {}
  for r = 1, 4, 1 do
    local line = ""
    for c = 1, 5, 1 do
      local char = Get_char(segments, r, c)
      line = line .. char
    end
    table.insert(display, line)
  end
  return display
end

function Get_empty_column()
  local segment = {}
  for r = 1, 4, 1 do
    local line = ""
    local char = " "
    line = line .. char
    table.insert(segment, line)
  end
  return segment
end

function Get_time_separator()
  local segment = {}
  for r = 1, 4, 1 do
    local line = ""
    for c = 1, 3, 1 do
      local char = " "
      if (r == 2 or r == 4) and c == 2 then
        char = "█"
      end
      line = line .. char
    end
    table.insert(segment, line)
  end
  return segment
end

function Merge_tables(tables)
  local from = tables[1]
  local merged = {}
  for r = 1, #from, 1 do
    for i = 2, #tables, 1 do
      from[r] = from[r] .. tables[i][r]
    end
    table.insert(merged, from[r])
  end
  return merged
end

function Get_segment(number)
  local segments = {
    { true,  true,  true,  true,  true,  true,  false },
    { false, true,  true,  false, false, false, false },
    { true,  true,  false, true,  false, true,  true },
    { true,  true,  true,  false, false, true,  true },
    { false, true,  true,  false, true,  false, true },
    { true,  false, true,  false, true,  true,  true },
    { true,  false, true,  true,  true,  true,  true },
    { true,  true,  true,  false, false, false, false },
    { true,  true,  true,  true,  true,  true,  true },
    { true,  true,  true,  false, true,  true,  true },
  }

  return segments[number + 1]
end

function Get_segments()
  local now = os.date("*t")
  local hours = now.hour
  local mins = now.min
  local secs = now.sec
  return {
    Get_display(Get_segment(math.floor(hours / 10))),
    Get_empty_column(),
    Get_display(Get_segment(hours % 10)),
    Get_time_separator(),
    Get_display(Get_segment(math.floor(mins / 10))),
    Get_empty_column(),
    Get_display(Get_segment(mins % 10)),
    Get_time_separator(),
    Get_display(Get_segment(math.floor(secs / 10))),
    Get_empty_column(),
    Get_display(Get_segment(secs % 10)),
  }
end

local output = Merge_tables(Get_segments())

return output
