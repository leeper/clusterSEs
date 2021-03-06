% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clusterIM.mlogit.R
\name{cluster.im.mlogit}
\alias{cluster.im.mlogit}
\title{Cluster-Adjusted Confidence Intervals And p-Values For mlogit}
\usage{
\method{cluster.im}{mlogit}(mod, dat, cluster, ci.level = 0.95,
  report = TRUE, truncate = FALSE)
}
\arguments{
\item{mod}{A model estimated using \code{mlogit}.}

\item{dat}{The data set used to estimate \code{mod}.}

\item{cluster}{A formula of the clustering variable.}

\item{ci.level}{What confidence level should CIs reflect?}

\item{report}{Should a table of results be printed to the console?}

\item{truncate}{Should outlying cluster-specific beta estimates be excluded?}
}
\value{
A list with the elements
\item{p.values}{A matrix of the estimated p-values.}
\item{ci}{A matrix of confidence intervals.}
}
\description{
Computes p-values and confidence intervals for multinomial logit models based on cluster-specific model estimation (Ibragimov and Muller 2010). A separate model is estimated in each cluster, and then p-values and confidence intervals are computed based on a t/normal distribution of the cluster-specific estimates.
}
\note{
Confidence intervals are centered on the cluster averaged estimate, which can diverge from original model estimates if clusters have different numbers of observations. Consequently, confidence intervals may not be centered on original model estimates. Any cluster for which all coefficients cannot be estimated will be automatically dropped from the analysis. If truncate = TRUE, any cluster for which any coefficient is more than 6 times the interquartile range from the cross-cluster mean will also be dropped as an outlier.
}
\examples{
\dontrun{

# example: predict type of heating system installed in house
require(mlogit)
data("Heating", package = "mlogit")
H <- Heating
H.ml <- mlogit.data(H, shape="wide", choice="depvar", varying=c(3:12))
m <- mlogit(depvar~ic+oc, H.ml)

# compute cluster-adjusted p-values
cluster.im.h <- cluster.im.mlogit(m, H.ml, ~ region)

}
}
\author{
Justin Esarey
}
\references{
Ibragimov, Rustam, and Ulrich K. Muller. 2010. "t-Statistic Based Correlation and Heterogeneity Robust Inference." \emph{Journal of Business & Economic Statistics} 28(4): 453-468. <DOI:10.1198/jbes.2009.08046>.
}

