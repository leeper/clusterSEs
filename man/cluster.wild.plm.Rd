% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clusterwild.plm.R
\name{cluster.wild.plm}
\alias{cluster.wild.plm}
\title{Wild Cluster Bootstrapped p-Values For PLM}
\usage{
\method{cluster.wild}{plm}(mod, dat, cluster, ci.level = 0.95,
  boot.reps = 1000, report = TRUE, prog.bar = TRUE)
}
\arguments{
\item{mod}{A "within" model estimated using \code{plm}.}

\item{dat}{The data set used to estimate \code{mod}.}

\item{cluster}{A formula of the clustering variable.}

\item{ci.level}{What confidence level should CIs reflect? (Note: only reported when \code{impose.null == FALSE}).}

\item{boot.reps}{The number of bootstrap samples to draw.}

\item{report}{Should a table of results be printed to the console?}

\item{prog.bar}{Show a progress bar of the bootstrap (= TRUE) or not (= FALSE).}
}
\value{
A list with the elements
\item{p.values}{A matrix of the estimated p-values.}
\item{ci}{A matrix of confidence intervals (if null not imposed).}
}
\description{
This software estimates p-values using wild cluster bootstrapped t-statistics for fixed effects panel linear models (Cameron, Gelbach, and Miller 2008). Residuals are repeatedly re-sampled by cluster to form a pseudo-dependent variable, a model is estimated for each re-sampled data set, and inference is based on the sampling distribution of the pivotal (t) statistic. The null is never imposed for PLM models.
}
\examples{
\dontrun{

# predict employment levels, cluster on group
require(plm)
data(EmplUK)

emp.1 <- plm(emp ~ wage + log(capital+1), data = EmplUK, model = "within",
             index=c("firm", "year"))
cluster.wild.plm(mod=emp.1, dat=EmplUK, cluster="group", ci.level = 0.95,
        boot.reps = 1000, report = TRUE, prog.bar = TRUE)

# cluster on time
cluster.wild.plm(mod=emp.1, dat=EmplUK, cluster="time", ci.level = 0.95, 
            boot.reps = 1000, report = TRUE, prog.bar = TRUE)

}
}
\author{
Justin Esarey
}
\references{
Cameron, A. Colin, Jonah B. Gelbach, and Douglas L. Miller. 2008. "Bootstrap-Based Improvements for Inference with Clustered Errors." \emph{The Review of Economics and Statistics} 90(3): 414-427. <DOI:10.1162/rest.90.3.414>.
}

