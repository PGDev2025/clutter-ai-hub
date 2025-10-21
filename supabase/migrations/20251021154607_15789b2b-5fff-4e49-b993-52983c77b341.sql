-- Fix function search path security issue
CREATE OR REPLACE FUNCTION public.update_users_updated_at()
RETURNS TRIGGER 
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  NEW.updatedAt = now();
  RETURN NEW;
END;
$$;