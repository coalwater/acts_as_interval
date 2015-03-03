[![Gem Version](https://badge.fury.io/rb/acts_as_interval.svg)](http://badge.fury.io/rb/acts_as_interval)
[![Build Status](https://travis-ci.org/coalwater/acts_as_interval.svg)](https://travis-ci.org/coalwater/acts_as_interval?branch=master)
[![Code Climate](https://codeclimate.com/github/coalwater/acts_as_interval/badges/gpa.svg)](https://codeclimate.com/github/coalwater/acts_as_interval)
# ActsAsInterval
Acts as interval provides useful functions for models that have intervals in
nature, models that have a start and end time, these methods are used to be
able to query or test for other intervals that happened before, after, or
overlap the instance you are testing

# Installation
Add this line to your Gemfile

    gem 'acts_as_interval', '~> 0.0'

# Usage
To enable acts_as_interval, add it to your model and specify the start and
end fields, for example a model that has `start_at` and `end_at` would look
like this

    acts_as_interval, start: :start_at, end: :end_at

# Methods
Assuming we have a model that is called `IntervalModel`

## Find past intervals
To find intervals that happened in the past aka started and ended before the
target instance started

    # interval_model is a pre-selected instance of IntervalModel
    interval_model.previous_interval_models

## Find future intervals
To find intervals that happened after the end of the target instance

    # interval_model is a pre-selected instance of IntervalModel
    interval_model.future_interval_models

## Find intersecting/overlapping intervals
To find other intervals that itersected or overlapped the target instance

    # interval_model is a pre-selected instance of IntervalModel
    interval_model.overlapping_inverval_models
