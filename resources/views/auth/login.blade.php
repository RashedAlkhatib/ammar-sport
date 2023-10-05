@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">دخول</div>

                <div class="card-body">
                    <form method="POST" style="text-align-last: center;" action="{{ route('sendOTP') }}">
                        @csrf
                        <h3>
                            <div   class="">ادخل رقم هاتفك للاشتراك في بوابة الرياضة</div>
                        </h3>
                        <div class="row mb-3 text-center" style="    place-content: center;">

                            <div class="col-md-8" style="    place-content: center;">
                                <input id="msisdn" type="number"
                                       class="form-control @error('msisdn') is-invalid @enderror"
                                       name="msisdn" value="{{ old('msisdn') }}" required
                                       autocomplete="msisdn" autofocus>

                                @error('msisdn')
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        <div class="row mb-0" style="    text-align: -webkit-center;">
                            <div class="">
                                <button type="submit" class="btn btn-primary">
                                   استمرار
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
