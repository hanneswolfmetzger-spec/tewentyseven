-- TWENTYSEVEN: Tabelle für den gemeinsamen Stand
-- Im Supabase Dashboard unter SQL Editor einfügen und ausführen.

create table if not exists public.spaces (
  id         text primary key,
  data       jsonb       not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.spaces enable row level security;

drop policy if exists "twentyseven anon access" on public.spaces;
create policy "twentyseven anon access"
  on public.spaces
  for all
  to anon
  using (true)
  with check (true);
