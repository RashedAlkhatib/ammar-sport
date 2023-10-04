@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">تحقق</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('login') }}">
                        @csrf

                        <div class="row mb-3">
                            <label for="email" class="col-md-4 col-form-label text-md-end">{{ $otp}}</label>
                            <input type="hidden" value="{{$phone_number}}" name="phone_number">
                            <div class="col-md-6">
                                <input id="otp" type="text"
                                       class="form-control @error('otp') is-invalid @enderror"
                                       name="otp" value="{{ old('otp') }}" required
                                       autocomplete="otp" autofocus>

                                @error('otp')
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        <div class="row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                               تأكيد
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
