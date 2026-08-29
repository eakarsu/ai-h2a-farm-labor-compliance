CREATE TABLE IF NOT EXISTS app_users(
  id BIGSERIAL PRIMARY KEY,email TEXT UNIQUE NOT NULL,name TEXT NOT NULL,role TEXT NOT NULL,password_hash TEXT NOT NULL,created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS workflow_cases(
  id BIGSERIAL PRIMARY KEY,workflow_id TEXT NOT NULL,reference TEXT UNIQUE NOT NULL,subject TEXT NOT NULL,owner TEXT NOT NULL,state TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,payload JSONB NOT NULL DEFAULT '{}'::jsonb,created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS audit_events(
  id BIGSERIAL PRIMARY KEY,event_time TIMESTAMPTZ NOT NULL DEFAULT NOW(),actor TEXT NOT NULL,action TEXT NOT NULL,object_type TEXT NOT NULL,object_reference TEXT NOT NULL,detail TEXT NOT NULL
);
CREATE TABLE IF NOT EXISTS saved_analyses(
  id BIGSERIAL PRIMARY KEY,workflow_id TEXT NOT NULL,actor TEXT NOT NULL,analysis_type TEXT NOT NULL,inputs JSONB NOT NULL,result JSONB NOT NULL,provider TEXT NOT NULL,model TEXT,created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);
CREATE TABLE IF NOT EXISTS integration_state(
  id TEXT PRIMARY KEY,name TEXT NOT NULL,category TEXT NOT NULL,mode TEXT NOT NULL,status TEXT NOT NULL,last_tested TIMESTAMPTZ
);
CREATE INDEX IF NOT EXISTS idx_workflow_cases_workflow ON workflow_cases(workflow_id);
CREATE INDEX IF NOT EXISTS idx_workflow_cases_due ON workflow_cases(due_date);
CREATE INDEX IF NOT EXISTS idx_audit_events_time ON audit_events(event_time DESC);

CREATE TABLE IF NOT EXISTS "op_job_order"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_job_order_due ON "op_job_order"(due_date);

CREATE TABLE IF NOT EXISTS "op_recruitment"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_recruitment_due ON "op_recruitment"(due_date);

CREATE TABLE IF NOT EXISTS "op_contract"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_contract_due ON "op_contract"(due_date);

CREATE TABLE IF NOT EXISTS "op_wage"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_wage_due ON "op_wage"(due_date);

CREATE TABLE IF NOT EXISTS "op_hours"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_hours_due ON "op_hours"(due_date);

CREATE TABLE IF NOT EXISTS "op_housing"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_housing_due ON "op_housing"(due_date);

CREATE TABLE IF NOT EXISTS "op_transport"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_transport_due ON "op_transport"(due_date);

CREATE TABLE IF NOT EXISTS "op_audit"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_caseReference" TEXT NOT NULL,
  "data_entity" TEXT NOT NULL,
  "data_reviewDate" DATE NOT NULL,
  "data_metric" NUMERIC(16,2) NOT NULL,
  "data_evidenceNotes" TEXT NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_audit_due ON "op_audit"(due_date);

CREATE TABLE IF NOT EXISTS "op_employer_master"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_recordId" TEXT NOT NULL,
  "data_name" TEXT NOT NULL,
  "data_status" TEXT NOT NULL,
  "data_effectiveDate" DATE NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_employer_master_due ON "op_employer_master"(due_date);

CREATE TABLE IF NOT EXISTS "op_worker_master"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_recordId" TEXT NOT NULL,
  "data_name" TEXT NOT NULL,
  "data_status" TEXT NOT NULL,
  "data_effectiveDate" DATE NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_worker_master_due ON "op_worker_master"(due_date);

CREATE TABLE IF NOT EXISTS "op_wage_master"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_recordId" TEXT NOT NULL,
  "data_name" TEXT NOT NULL,
  "data_status" TEXT NOT NULL,
  "data_effectiveDate" DATE NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_wage_master_due ON "op_wage_master"(due_date);

CREATE TABLE IF NOT EXISTS "op_housing_master"(
  id BIGSERIAL PRIMARY KEY,reference TEXT UNIQUE NOT NULL,status TEXT NOT NULL,owner TEXT NOT NULL,risk TEXT NOT NULL,due_date DATE NOT NULL,amount NUMERIC(16,2) NOT NULL DEFAULT 0,
  "data_recordId" TEXT NOT NULL,
  "data_name" TEXT NOT NULL,
  "data_status" TEXT NOT NULL,
  "data_effectiveDate" DATE NOT NULL
);
CREATE INDEX IF NOT EXISTS idx_op_housing_master_due ON "op_housing_master"(due_date);
